import 'package:flutter_bloc/flutter_bloc.dart';

part 'user_home_state.dart';

class UserHomeCubit extends Cubit<UserHomeState> {
  UserHomeCubit() : super(UserHomeState.initial());

  @override
  Future<void> close() {
    return super.close();
  }
}
