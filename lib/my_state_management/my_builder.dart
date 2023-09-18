import 'package:flutter/material.dart';
import 'package:my_own_cubit/my_state_management/my_cubit.dart';

import 'my_inherited_cubit.dart';

class MyBlocBuilder<C extends MyCubit<S>, S> extends StatelessWidget {
  const MyBlocBuilder({
    super.key,
    required this.builder,
  });
  final Widget Function(BuildContext, S) builder;

  @override
  Widget build(BuildContext context) {
    C cubit = MyInheritedNotifier.of<C>(context);
    return ValueListenableBuilder<S>(
      valueListenable: cubit,
      builder: (context, state, _) {
        return builder(context, state);
      },
    );
  }
}
