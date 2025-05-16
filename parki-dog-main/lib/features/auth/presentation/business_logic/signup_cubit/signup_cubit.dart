import 'package:parki_dog/features/auth/export/auth_export.dart';

part 'signup_state.dart';

class SignupCubit extends Cubit<SignupState> {
  SignupUseCase signupUseCase;

  SignupCubit(this.signupUseCase) : super(const SignupState());

  signUp(BuildContext context,
      {required Map<String, dynamic> body,
      bool fromX = false,
      bool fromNotNow = false,
      bool fromSubmit = false}) async {
    emit(state.copyWith(
        status: SignupStatus.loading,
        fromSubmit: fromSubmit,
        fromX: fromX,
        fromNotNow: fromNotNow));
    final result = await signupUseCase(SignupParameters(body: body));
    if (result.$1 != null) {
      emit(state.copyWith(
          status: SignupStatus.error, error: result.$1!.message.tr()));
    } else {
      // await getIt.get<AppPreferences>().setSecuredString(
      //     userToken, result.$2!.token ?? '');
      emit(state.copyWith(
          status: SignupStatus.success,
          signupResponse: result.$2!,
          fromNotNow: fromNotNow,
          fromX: fromX,
          fromSubmit: fromSubmit));
    }
  }
}
