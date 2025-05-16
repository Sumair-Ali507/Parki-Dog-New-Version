import 'package:parki_dog/features/map/export/map_export.dart';

class NotifyMeCubit extends Cubit<NotifyMeState> {
  NotifyMeCubit() : super(NotifyMeState(isToggled: false));

  void toggle() {
    emit(NotifyMeState(isToggled: !state.isToggled));
  }
}
