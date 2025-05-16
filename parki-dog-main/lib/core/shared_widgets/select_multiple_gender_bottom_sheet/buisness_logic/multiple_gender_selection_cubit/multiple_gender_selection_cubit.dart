import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/shared_widgets/gender_selection_widget.dart';
import 'package:parki_dog/core/shared_widgets/select_multiple_gender_bottom_sheet/buisness_logic/multiple_gender_selection_cubit/multiple_gender_selection_state.dart';

class MultipleGenderSelectionCubit extends Cubit<MultipleGenderSelectionState> {
  MultipleGenderSelectionCubit() : super(const MultipleGenderSelectionState());

  void toggleGender(Gender gender) {
    final currentSelectedGenders = List<Gender>.from(state.selectedGenders);
    if (currentSelectedGenders.contains(gender)) {
      currentSelectedGenders.remove(gender);
    } else {
      currentSelectedGenders.add(gender);
    }
    emit(state.copyWith(selectedGenders: currentSelectedGenders));
  }

  void selectAllGenders() {
    emit(state.copyWith(selectedGenders: Gender.values.toList()));
  }

  void clearSelection() {
    emit(state.copyWith(selectedGenders: []));
  }

  bool isSelected(Gender gender) {
    return state.selectedGenders.contains(gender);
  }
}
