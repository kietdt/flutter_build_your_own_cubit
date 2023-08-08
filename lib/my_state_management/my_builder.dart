import 'package:flutter/material.dart';
import 'package:my_own_cubit/my_state_management/my_cubit.dart';

import 'my_inherited_cubit.dart';

class MyBlocBuilder<C extends MyCubit<S>, S> extends StatefulWidget {
  const MyBlocBuilder({
    super.key,
    required this.builder,
  });
  final Widget Function(BuildContext, S) builder;

  @override
  State<StatefulWidget> createState() {
    return _MyBuilderState<C, S>();
  }
}

class _MyBuilderState<C extends MyCubit<S>, S> extends State<MyBlocBuilder> {
  @override
  Widget build(BuildContext context) {
    var cubit = MyInheritedNotifier.of<C>(context);

    return ValueListenableBuilder<S>(
      valueListenable: cubit,
      builder: (context, state, _) => widget.builder(context, state),
    );
  }
}
