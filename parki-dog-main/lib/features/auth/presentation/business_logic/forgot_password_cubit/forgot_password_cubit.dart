import 'package:parki_dog/features/auth/export/auth_export.dart';

part 'forgot_password_state.dart';

class ForgotPasswordCubit extends Cubit<ForgotPasswordState> {
  ForgotPasswordUseCase forgotPasswordUseCase;

  ForgotPasswordCubit(this.forgotPasswordUseCase)
      : super(const ForgotPasswordState());

  TextEditingController phoneController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  forgotPassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      context.pushNamed(Routes.otpRoute);
      // // emit(ForgotPasswordLoading());
      // emit(state.copyWith(status: ForgotPasswordStatus.loading));
      // final result = await ForgotPasswordUseCase(ForgotPasswordParameters(
      //     phone: phoneController.text);
      // if (result.$1 != null) {
      //   // emit(ForgotPasswordError(error: result.$1!.message));
      //   emit(state.copyWith(
      //       status: ForgotPasswordStatus.error, error: result.$1!.message));
      // } else {
      //   await getIt.get<AppPreferences>().setSecuredString(
      //       userToken, result.$2!.token ?? '');
      //   // emit(ForgotPasswordSuccess(ForgotPasswordResponse: result.$2!));
      //   emit(state.copyWith(
      //       status: ForgotPasswordStatus.success,
      //       response: result.$2!));
      // }
    }
  }

  @override
  Future<void> close() {
    phoneController.dispose();
    return super.close();
  }
}
