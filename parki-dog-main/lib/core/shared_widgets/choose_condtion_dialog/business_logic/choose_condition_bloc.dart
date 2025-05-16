import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ChooseConditionCubit extends Cubit<Condition> {
  ChooseConditionCubit() : super(Condition.greaterThan);

  void changeCondition(Condition condition) => emit(condition);
}

enum Condition {
  greaterThan(LocaleKeys.condition_greaterThan, AppInt.i1),
  lessThan(LocaleKeys.condition_lessThan, AppInt.i2);

  const Condition(this.name, this.id);

  final String name;
  final int id;
}
