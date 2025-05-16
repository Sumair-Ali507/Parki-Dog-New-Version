import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/shared_widgets/show_top_snack_bar.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_mail_response.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_email_use_case.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';
part 'change_email_state.dart';

class ChangeEmailCubit extends Cubit<ChangeEmailState> {
  ChangeEmailUseCase changeEmailUseCase;

  ChangeEmailCubit(this.changeEmailUseCase) : super(const ChangeEmailState());
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();

  changeEmail(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      showTopSnackBar(context,
          message: LocaleKeys.signInAndSecurity_emailChanged.tr());
      //
      // // emit(ChangeEmailLoading());
      // emit(state.copyWith(status: ChangeEmailStatus.loading));
      // final result = await changeEmailUseCase(ChangeEmailParameters(
      //     email: emailController.text, password: passwordController.text));
      // if (result.$1 != null) {
      //   // emit(ChangeEmailError(error: result.$1!.message));
      //   emit(state.copyWith(status: ChangeEmailStatus.error, error: result.$1!.message));
      // } else {
      //   await getIt.get<AppPreferences>().setSecuredString(
      //       userToken, result.$2!.token ?? '');
      //   // emit(ChangeEmailSuccess(changeEmailResponse: result.$2!));
      //   emit(state.copyWith(status: ChangeEmailStatus.success, changeEmailResponse: result.$2!));
      // }
    }
  }

  @override
  Future<void> close() {
    emailController.dispose();
    passwordController.dispose();
    return super.close();
  }
}
