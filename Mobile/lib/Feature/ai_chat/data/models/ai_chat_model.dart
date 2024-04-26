class ChatbotResponse {
  final bool status;
  final String message;
  final String data;

  ChatbotResponse({
    required this.status,
    required this.message,
    required this.data,
  });

  factory ChatbotResponse.fromJson(Map<String, dynamic> json) {
    return ChatbotResponse(
      status: json['status'],
      message: json['message'],
      data: json['data'],
    );
  }
}
