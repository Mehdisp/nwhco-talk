part of 'user_home_cubit.dart';

enum UserHomeStatus {
  initial,
  unauthorized,
  loading,
  success,
  failed,
}

class UserHomeState {
  final UserHomeStatus status;

  bool get unauthorized => status == UserHomeStatus.unauthorized;
  bool get loading => status == UserHomeStatus.loading;

  UserHomeState({
    required this.status,
  });

  factory UserHomeState.initial() {
    return UserHomeState(
      status: UserHomeStatus.initial,
    );
  }

  factory UserHomeState.unauthorized() {
    return UserHomeState(
      status: UserHomeStatus.unauthorized,
    );
  }

  UserHomeState copyWith({
    UserHomeStatus? status,
  }) {
    return UserHomeState(
      status: status ?? this.status,
    );
  }
}
