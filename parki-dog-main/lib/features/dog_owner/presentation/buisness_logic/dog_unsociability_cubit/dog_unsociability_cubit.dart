import 'package:parki_dog/core/shared_widgets/choose_condtion_dialog/business_logic/choose_condition_bloc.dart';
import 'package:parki_dog/features/dog_owner/data/models/dog_unsociability_model.dart';
import 'package:parki_dog/features/dog_owner/export//dog_owner_export.dart';

class DogUnsociabilityCubitsCubit extends Cubit<DogUnsociabilityModel> {
  final TextEditingController breedsController = TextEditingController();
  final TextEditingController gendersController = TextEditingController();
  final TextEditingController weightController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  DogUnsociabilityCubitsCubit() : super(DogUnsociabilityModel());

  void updateDogUnsociability({
    List<Breed>? breeds,
    List<Gender>? genders,
    double? weight,
    Condition? condition,
  }) {
    emit(state.copyWith(
      breeds: breeds ?? state.breeds,
      genders: genders ?? state.genders,
      weight: weight ?? state.weight,
      condition: condition ?? state.condition,
    ));
  }

  @override
  Future<void> close() {
    // Dispose controllers when the cubit is closed
    breedsController.dispose();
    gendersController.dispose();
    weightController.dispose();
    return super.close();
  }
}
