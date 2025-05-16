class AppSliderState {
  final int currentIndex;

  AppSliderState({
    required this.currentIndex,
  });

  AppSliderState copyWith({
    int? currentIndex,
  }) {
    return AppSliderState(currentIndex: currentIndex ?? this.currentIndex);
  }
}
