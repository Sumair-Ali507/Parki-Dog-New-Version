import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/helpers/app_regex.dart';
import 'package:parki_dog/core/services/service_locator.dart';
import 'package:parki_dog/core/shared_widgets/svg_icon.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/features/auth/presentation/widgets/password_input_field.dart';
import 'package:parki_dog/features/sign_in_and_security/presentation/busniess_logic/change_password_cubit/change_password_cubit.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

class ChangePasswordScreen extends StatelessWidget {
  const ChangePasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ChangePasswordCubit(getIt.get()),
      child: BlocBuilder<ChangePasswordCubit, ChangePasswordState>(
        builder: (changePasswordContext, changePasswordState) {
          ChangePasswordCubit changePasswordCubit =
              changePasswordContext.read<ChangePasswordCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: const SizedBox(),
              title:
                  const Text(LocaleKeys.signInAndSecurity_changePassword).tr(),
              actions: [
                IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const SvgIcon(
                        color: ColorsManager.iconDefault,
                        assetName: ImageAssets.close))
              ],
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDouble.d24, vertical: AppDouble.d32),
              child: ElevatedButton(
                  onPressed: () => changePasswordCubit.changePassword(context),
                  child: const Text(LocaleKeys.signInAndSecurity_save).tr()),
            ),
            body: Form(
              key: changePasswordCubit.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d32, horizontal: AppDouble.d24),
                children: [
                  PasswordInputField(
                    hint: LocaleKeys.auth_passwordHint.tr(),
                    label: LocaleKeys.signInAndSecurity_currentPassword.tr(),
                    controller: changePasswordCubit.oldPasswordController,
                    validator: (passwordText) {
                      if (passwordText == null || passwordText.isEmpty) {
                        return LocaleKeys.validation_emptyField.tr();
                      }
                      if (!AppRegex.isPasswordValid(passwordText)) {
                        return LocaleKeys.validation_invalidPassword.tr();
                      }
                      return null; // Validation passed
                    },
                  ),
                  const SizedBox(height: AppDouble.d24),
                  PasswordInputField(
                    hint: LocaleKeys.auth_passwordHint.tr(),
                    label: LocaleKeys.signInAndSecurity_newPassword.tr(),
                    controller: changePasswordCubit.newPasswordController,
                    onChanged: (_) => changePasswordCubit.checkPasswordMatch(),
                    validator: (passwordText) {
                      if (passwordText == null || passwordText.isEmpty) {
                        return LocaleKeys.validation_emptyField.tr();
                      }
                      if (!AppRegex.isPasswordValid(passwordText)) {
                        return LocaleKeys.validation_invalidPassword.tr();
                      }
                      return null; // Validation passed
                    },
                  ),
                  const SizedBox(height: AppDouble.d24),
                  PasswordInputField(
                    hint: LocaleKeys.auth_passwordHint.tr(),
                    label: LocaleKeys.signInAndSecurity_reTypePassword.tr(),
                    controller: changePasswordCubit.reTypeNewPasswordController,
                    labelStyle: changePasswordState.passwordMatch
                        ? TextStyles.font12Green800SemiBold()
                        : null,
                    isPasswordsMatches: changePasswordState.passwordMatch,
                    validator: (reTypePasswordText) {
                      if (reTypePasswordText == null ||
                          reTypePasswordText.isEmpty) {
                        return LocaleKeys.validation_emptyField.tr();
                      }
                      if (!AppRegex.isPasswordValid(reTypePasswordText)) {
                        return LocaleKeys.validation_invalidPassword.tr();
                      }
                      if (changePasswordCubit.newPasswordController.text !=
                          reTypePasswordText) {
                        return LocaleKeys.validation_passwordsNotMatch.tr();
                      }
                      return null; // Validation passed
                    },
                    onChanged: (_) => changePasswordCubit.checkPasswordMatch(),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppDouble.d16)),
                      borderSide: BorderSide(
                        color: changePasswordState.passwordMatch
                            ? ColorsManager.green800
                            : ColorsManager.grey200, // Default border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppDouble.d16)),
                      borderSide: BorderSide(
                        color: changePasswordState.passwordMatch
                            ? ColorsManager.green800
                            : ColorsManager.grey200, // Default border color
                      ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
