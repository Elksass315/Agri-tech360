part of 'ai_chat_cubit.dart';

abstract class AiChatState extends Equatable {
  const AiChatState();

  @override
  List<Object?> get props => [];
}

class AiChatInitial extends AiChatState {}

class AiChatLoading extends AiChatState {}

class AiChatLoaded extends AiChatState {
  final List<ChatMessage> messages;

  const AiChatLoaded(this.messages);

  @override
  List<Object?> get props => [messages];
}

class AiChatError extends AiChatState {
  final String errorMessage;

  const AiChatError(this.errorMessage);

  @override
  List<Object?> get props => [errorMessage];
}
