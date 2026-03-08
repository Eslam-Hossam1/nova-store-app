part of 'add_comment_cubit.dart';

sealed class AddCommentState {
  const AddCommentState();
}

final class AddCommentInitial extends AddCommentState {
  const AddCommentInitial();
}

final class AddCommentLoading extends AddCommentState {
  const AddCommentLoading();
}

final class AddCommentSuccess extends AddCommentState {
  const AddCommentSuccess();
}

final class AddCommentFailure extends AddCommentState {
  final String errorMessage;
  const AddCommentFailure({required this.errorMessage});
}
