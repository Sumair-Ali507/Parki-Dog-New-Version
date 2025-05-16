import 'package:parki_dog/features/auth/export/auth_export.dart';

part 'verify_mail_state.dart';

class VerifyMailCubit extends Cubit<VerifyMailState> {
  VerifyEmailUseCase verifyEmailUseCase;
  TextEditingController codeController = TextEditingController();

  final formKey = GlobalKey<FormState>();

  VerifyMailCubit(this.verifyEmailUseCase) : super(const VerifyMailState());

  verifyEmail(BuildContext context) async {
    emit(state.copyWith(status: VerifyMailStatus.loading));
    final result = await verifyEmailUseCase(
        VerifyEmailParameters(code: codeController.text));
    if (result.$1 != null) {
      emit(state.copyWith(
          status: VerifyMailStatus.error, error: result.$1!.message.tr()));
    } else {
      // await getIt.get<AppPreferences>().setSecuredString(
      //     userToken, result.$2!.token ?? '');
      emit(state.copyWith(
          status: VerifyMailStatus.success, verifyEmailResponse: result.$2!));
    }
  }

  @override
  Future<void> close() {
    codeController.dispose();
    return super.close();
  }
}
