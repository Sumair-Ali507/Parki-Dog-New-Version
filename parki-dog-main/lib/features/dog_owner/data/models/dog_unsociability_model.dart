import 'package:parki_dog/core/shared_widgets/choose_condtion_dialog/business_logic/choose_condition_bloc.dart';
import 'package:parki_dog/core/shared_widgets/gender_selection_widget.dart';
import 'package:parki_dog/features/dog_owner/data/models/breed_model.dart';

class DogUnsociabilityModel {
  final List<Breed>? breeds;
  final List<Gender>? genders;
  final double? weight;
  final Condition condition;

  DogUnsociabilityModel(
      {this.breeds,
      this.genders,
      this.weight,
      this.condition = Condition.greaterThan});

  DogUnsociabilityModel copyWith(
      {List<Breed>? breeds,
      List<Gender>? genders,
      double? weight,
      Condition? condition}) {
    return DogUnsociabilityModel(
        breeds: breeds ?? this.breeds,
        genders: genders ?? this.genders,
        weight: weight ?? this.weight,
        condition: condition ?? this.condition);
  }
}
