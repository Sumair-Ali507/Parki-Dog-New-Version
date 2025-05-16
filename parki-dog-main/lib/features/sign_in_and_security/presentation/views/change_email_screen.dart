import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:parki_dog/core/extensions/extenstions.dart';
import 'package:parki_dog/core/helpers/app_regex.dart';
import 'package:parki_dog/core/services/service_locator.dart';
import 'package:parki_dog/core/shared_widgets/custom_input_field.dart';
import 'package:parki_dog/core/shared_widgets/svg_icon.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/features/auth/presentation/widgets/password_input_field.dart';
import 'package:parki_dog/features/sign_in_and_security/presentation/busniess_logic/change_email_cubit/change_email_cubit.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

class ChangeEmailScreen extends StatelessWidget {
  const ChangeEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: BlocProvider(
        create: (context) => ChangeEmailCubit(getIt.get()),
        child: BlocBuilder<ChangeEmailCubit, ChangeEmailState>(
          builder: (changeMailContext, changeMailState) {
            ChangeEmailCubit changeMailCubit =
                changeMailContext.read<ChangeEmailCubit>();
            return Scaffold(
              appBar: AppBar(
                title:
                    const Text(LocaleKeys.signInAndSecurity_changeEmail).tr(),
                leading: const SizedBox(),
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
                padding: const EdgeInsets.all(AppDouble.d16),
                child: ElevatedButton(
                    onPressed: () => changeMailCubit.changeEmail(context),
                    child: const Text(LocaleKeys.signInAndSecurity_save).tr()),
              ),
              body: Form(
                key: changeMailCubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppDouble.d32, horizontal: AppDouble.d24),
                  children: [
                    CustomInputField(
                      hint: LocaleKeys.auth_emailHint.tr(),
                      label: LocaleKeys.signInAndSecurity_emailAddress.tr(),
                      controller: changeMailCubit.emailController,
                      textInputType: TextInputType.emailAddress,
                      validator: (mailText) {
                        if (mailText == null || mailText.isEmpty) {
                          return LocaleKeys.validation_emptyField.tr();
                        }
                        if (!AppRegex.isEmailValid(mailText)) {
                          return LocaleKeys.validation_invalidEmail.tr();
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: AppDouble.d24),
                    PasswordInputField(
                      hint: LocaleKeys.auth_passwordHint.tr(),
                      label: LocaleKeys.signInAndSecurity_password.tr(),
                      helperText:
                          LocaleKeys.signInAndSecurity_passwordHelper.tr(),
                      controller: changeMailCubit.passwordController,
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
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
