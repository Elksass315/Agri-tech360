import 'package:dash_chat_2/dash_chat_2.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:smartsoil/Feature/ai_chat/data/models/ai_chat_model.dart';
import 'package:smartsoil/core/networking/api_services.dart';
import 'package:smartsoil/core/networking/end_boint.dart';
import 'package:smartsoil/core/helper/local_services.dart';
import 'package:smartsoil/core/themaing/app_colors.dart';

class ChatView extends StatefulWidget {
  const ChatView({Key? key}) : super(key: key);

  @override
  State<ChatView> createState() => _ChatViewState();
}

class _ChatViewState extends State<ChatView> {
  final _user = ChatUser(id: '1', firstName: 'user-data');
  final _bot = ChatUser(
    id: '2',
    firstName: 'Agri-tech360',
    profileImage: 'assets/images/agri-tech360_logo.png',
  );
  List<ChatMessage> messages = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorManger.whiteColor,
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Agri-tech360 Ai Chat"),
        backgroundColor: ColorManger.whiteColor,
      ),
      body: DashChat(
        currentUser: _user,
        onSend: onSend,
        messages: messages,
        messageOptions: const MessageOptions(
          currentUserTextColor: ColorManger.whiteColor,
          currentUserContainerColor: ColorManger.primaryColor,
        ),
        inputOptions: InputOptions(
          inputTextStyle: const TextStyle(
            color: ColorManger.blackColor,
          ),
          sendButtonBuilder: (send) {
            return IconButton(
              onPressed: send,
              icon: const Icon(
                Icons.send,
                color: ColorManger.primaryColor,
              ),
            );
          },
        ),
      ),
    );
  }

  void onSend(ChatMessage message) async {
    setState(() {
      messages.insert(0, message);
    });

    List<Map<String, dynamic>> messagesHistory =
        messages.reversed.map((message) {
      if (message.user == _user) {
        return {'role': 'user', 'content': message.text};
      } else {
        return {'role': 'assistant', 'content': message.text};
      }
    }).toList();

    // Make request to generate response
    var response = await makeRequest(messagesHistory);

    // Update chat UI with response
    if (response != null) {
      setState(() {
        messages.insert(
          0,
          ChatMessage(
            text: response,
            user: _bot,
            createdAt: DateTime.now(),
          ),
        );
      });
    }
  }

  Future<String?> makeRequest(
      List<Map<String, dynamic>> messagesHistory) async {
    try {
      String token = LocalServices.getData(key: 'token');

      List<String> texts = messagesHistory
          .map<String>((message) => message['content'].toString())
          .toList();
      String concatenatedText = texts.join(' ');
      FormData formData = FormData.fromMap({
        'message': concatenatedText,
      });

      var response = await ApiServices.postFormData(
          endpoint: chatendpoint, formData: formData, token: token);

      ChatbotResponse data = ChatbotResponse.fromJson(response);
      return data.data;
    } catch (e) {
      return null;
    }
  }
}
