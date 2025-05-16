import 'package:parki_dog/features/profile/export/profile_export.dart';

part 'logout_state.dart';

class LogoutCubit extends Cubit<LogoutState> {
  LogoutUseCase logoutUseCase;

  LogoutCubit(this.logoutUseCase) : super(const LogoutState());

  logout() async {
    emit(state.copyWith(status: LogoutStatus.loading));
    final result = await logoutUseCase(const NoParameters());
    if (result.$1 != null) {
      emit(state.copyWith(
          status: LogoutStatus.error, error: result.$1!.message.tr()));
    } else {
      await getIt.get<AppPreferences>().clearAllSecuredData();
      emit(state.copyWith(
          status: LogoutStatus.success, logoutResponse: result.$2!));
    }
  }
}
