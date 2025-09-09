part of 'guidelines_cubit.dart';

enum GuidelinesStatus {
  initial,
  loading,
  loaded,
  failed,
}

class GuidelinesState {
  final GuidelinesStatus status;

  GuidelinesState({
    required this.status,
  });

  factory GuidelinesState.initial() {
    return GuidelinesState(
      status: GuidelinesStatus.initial,
    );
  }

  GuidelinesState copyWith({
    GuidelinesStatus? status,
  }) {
    return GuidelinesState(
      status: status ?? this.status,
    );
  }
}
