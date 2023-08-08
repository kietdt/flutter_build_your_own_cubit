import 'package:flutter/material.dart';
import 'package:my_own_cubit/my_state_management/my_cubit.dart';

class MyInheritedNotifier<C extends MyCubit> extends InheritedNotifier {
  const MyInheritedNotifier({
    super.key,
    required super.child,
    required MyCubit myCubit,
  }) : super(
          notifier: myCubit,
        );

  static C of<C extends MyCubit>(BuildContext context) {
    return context
        .dependOnInheritedWidgetOfExactType<MyInheritedNotifier<C>>()!
        .notifier! as C;
  }
}
