import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import 'my_inherited_cubit.dart';

class MyCubit<S> extends ChangeNotifier implements ValueListenable<S> {
  S _state;
  S get state => _state;

  MyCubit(this._state);

  @override
  S get value => _state;

  void emit(S newState) {
    if (newState == _state) {
      return;
    }
    _state = newState;
    notifyListeners();
  }
}

extension BuildContextExtensions on BuildContext {
  read<C extends MyCubit>() {
    C cubit = dependOnInheritedWidgetOfExactType<MyInheritedNotifier<C>>()!
        .notifier! as C;
    return cubit;
  }
}
