part of 'comment_cubit.dart';

sealed class CommentState extends Equatable {
  const CommentState();

  @override
  List<Object> get props => [];
}

final class CommentInitial extends CommentState {}

class AddCommentLoading extends CommentState {}

class AddCommentSuccess extends CommentState {
  const AddCommentSuccess();
}

class AddCommentError extends CommentState {
  final String error;
  const AddCommentError({required this.error});
}

class GetCommentsLoading extends CommentState {}

class GetCommentsSuccess extends CommentState {
  final List<CommentModel> comments;

  const GetCommentsSuccess({required this.comments});
}

class GetCommentsError extends CommentState {
  final String error;
  const GetCommentsError({required this.error});
}
