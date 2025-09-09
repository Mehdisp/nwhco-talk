part of 'chat_cubit.dart';

enum ChatStatus {
  loading,
  loaded,
  failed,
}

class ChatState {
  final ChatStatus status;
  bool get isLoading => status == ChatStatus.loading;
  bool get isFailed => status == ChatStatus.failed;

  ChatState({
    required this.status,
  });

  factory ChatState.initial() {
    return ChatState(
      status: ChatStatus.loading,
    );
  }

  ChatState copyWith({
    ChatStatus? status,
  }) {
    return ChatState(
      status: status ?? this.status,
    );
  }
}
