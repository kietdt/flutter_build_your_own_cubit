import 'package:my_own_cubit/my_state_management/my_cubit.dart';

import 'simple_counter_state.dart';

class SimpleCounterBloc extends MyCubit<SimpleCounterState> {
  SimpleCounterBloc() : super(SimpleCounterState());

  void increase() {
    int count = state.count + 1;
    emit(state.copyWith(count: count));
  }
}
