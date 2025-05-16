import 'package:easy_localization/easy_localization.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/core/shared_widgets/show_top_snack_bar.dart';
import 'package:parki_dog/features/sign_in_and_security/data/models/change_password_response.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_password_use_case.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';
part 'change_password_state.dart';

class ChangePasswordCubit extends Cubit<ChangePasswordState> {
  ChangePasswordUseCase changePasswordUseCase;

  ChangePasswordCubit(this.changePasswordUseCase)
      : super(const ChangePasswordState());

  TextEditingController oldPasswordController = TextEditingController();
  TextEditingController newPasswordController = TextEditingController();
  TextEditingController reTypeNewPasswordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  changePassword(BuildContext context) async {
    if (formKey.currentState!.validate()) {
      showTopSnackBar(context,
          message: LocaleKeys.signInAndSecurity_passwordChanged.tr());

      // // emit(ChangePasswordLoading());
      // emit(state.copyWith(status: ChangePasswordStatus.loading));
      // final result = await changePasswordUseCase(ChangePasswordParameters(
      //     currentPassword: oldPasswordController.text, newPassword: newPasswordController.text));
      // if (result.$1 != null) {
      //   // emit(ChangePasswordError(error: result.$1!.message));
      //   emit(state.copyWith(status: ChangePasswordStatus.error, error: result.$1!.message));
      // } else {
      //   await getIt.get<AppPreferences>().setSecuredString(
      //       userToken, result.$2!.token ?? '');
      //   // emit(ChangePasswordSuccess(changePasswordResponse: result.$2!));
      //   emit(state.copyWith(status: ChangePasswordStatus.success, changePasswordResponse: result.$2!));
      // }
    }
  }

  // Password matching logic
  void checkPasswordMatch() {
    if (newPasswordController.text == reTypeNewPasswordController.text) {
      emit(state.copyWith(passwordMatch: true));
    } else {
      emit(state.copyWith(passwordMatch: false));
    }
  }

  @override
  Future<void> close() {
    oldPasswordController.dispose();
    newPasswordController.dispose();
    reTypeNewPasswordController.dispose();
    return super.close();
  }
}
