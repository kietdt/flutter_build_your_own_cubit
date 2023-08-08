class SimpleCounterState {
  final int count;

  SimpleCounterState({
    this.count = 0,
  });

  SimpleCounterState copyWith({int? count}) {
    return SimpleCounterState(
      count: count ?? this.count,
    );
  }
}
