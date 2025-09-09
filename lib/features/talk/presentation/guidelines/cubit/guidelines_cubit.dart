import 'package:flutter_bloc/flutter_bloc.dart';

part 'guidelines_state.dart';

class GuidelinesCubit extends Cubit<GuidelinesState> {
  GuidelinesCubit() : super(GuidelinesState.initial());
}
