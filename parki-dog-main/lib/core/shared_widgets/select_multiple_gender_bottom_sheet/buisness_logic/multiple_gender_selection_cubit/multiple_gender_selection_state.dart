import 'package:parki_dog/core/shared_widgets/gender_selection_widget.dart';

class MultipleGenderSelectionState {
  final List<Gender> selectedGenders;

  const MultipleGenderSelectionState({this.selectedGenders = const []});

  MultipleGenderSelectionState copyWith({List<Gender>? selectedGenders}) {
    return MultipleGenderSelectionState(
      selectedGenders: selectedGenders ?? this.selectedGenders,
    );
  }
}
