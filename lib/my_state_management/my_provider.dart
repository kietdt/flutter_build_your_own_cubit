import 'package:flutter/material.dart';
import 'package:my_own_cubit/my_state_management/my_cubit.dart';
import 'package:my_own_cubit/my_state_management/my_inherited_cubit.dart';

class MyBlocProvider<C extends MyCubit> extends StatefulWidget {
  const MyBlocProvider({
    super.key,
    required this.create,
    required this.child,
  });
  final C Function(BuildContext context) create;
  final Widget child;

  @override
  State<StatefulWidget> createState() {
    return _MyBlocProviderState<C>();
  }
}

class _MyBlocProviderState<C extends MyCubit> extends State<MyBlocProvider> {
  @override
  Widget build(BuildContext context) {
    return MyInheritedNotifier<C>(
      myCubit: widget.create(context),
      child: widget.child,
    );
  }
}
