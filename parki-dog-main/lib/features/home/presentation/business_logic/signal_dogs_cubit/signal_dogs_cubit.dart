import 'package:parki_dog/features/home/export/home_export.dart';

class SignalDogsCubit extends Cubit<SignalDogsModel> {
  SignalDogsCubit() : super(SignalDogsModel(maleDogs: 0, femaleDogs: 0));

  void incrementMaleDogs() {
    emit(SignalDogsModel(
        maleDogs: state.maleDogs + 1, femaleDogs: state.femaleDogs));
  }

  void decrementMaleDogs() {
    if (state.maleDogs > 0) {
      emit(SignalDogsModel(
          maleDogs: state.maleDogs - 1, femaleDogs: state.femaleDogs));
    }
  }

  void incrementFemaleDogs() {
    emit(SignalDogsModel(
        maleDogs: state.maleDogs, femaleDogs: state.femaleDogs + 1));
  }

  void decrementFemaleDogs() {
    if (state.femaleDogs > 0) {
      emit(SignalDogsModel(
          maleDogs: state.maleDogs, femaleDogs: state.femaleDogs - 1));
    }
  }
}
