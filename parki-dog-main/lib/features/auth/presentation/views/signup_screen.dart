import 'package:parki_dog/features/auth/export/auth_export.dart';

class SignupScreen extends StatelessWidget {
  const SignupScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => DogOwnerProcessCubit(),
      child: BlocBuilder<DogOwnerProcessCubit, DogOwnerProcessModel>(
        builder: (dogOwnerProcessContext, dogOwnerProcess) {
          DogOwnerProcessCubit dogOwnerProcessCubit =
              dogOwnerProcessContext.read<DogOwnerProcessCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              title: const Text(LocaleKeys.auth_createAnAccount).tr(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDouble.d24, vertical: AppDouble.d32),
              child: ElevatedButton(
                  onPressed: () {
                    if (dogOwnerProcessCubit.signUpFormKey.currentState!
                        .validate()) {
                      context.pushNamed(Routes.userTypeRoute,
                          arguments: dogOwnerProcessCubit);
                    }
                  },
                  child: const Text(LocaleKeys.auth_getStarted).tr()),
            ),
            body: Form(
              key: dogOwnerProcessCubit.signUpFormKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d32, horizontal: AppDouble.d24),
                children: [
                  CustomInputField(
                    hint: LocaleKeys.auth_emailHint.tr(),
                    label: LocaleKeys.auth_email.tr(),
                    controller: dogOwnerProcessCubit.emailController,
                    textInputType: TextInputType.emailAddress,
                    onChanged: (email) {
                      dogOwnerProcessCubit.updateDogOwnerProcess(email: email);
                    },
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
                    label: LocaleKeys.auth_password.tr(),
                    controller: dogOwnerProcessCubit.passwordController,
                    onChanged: (_) => dogOwnerProcessCubit.checkPasswordMatch(),
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
                    label: LocaleKeys.auth_reTypePassword.tr(),
                    controller: dogOwnerProcessCubit.reTypePasswordController,
                    labelStyle: dogOwnerProcess.passwordMatch
                        ? TextStyles.font12Green800SemiBold()
                        : null,
                    isPasswordsMatches: dogOwnerProcess.passwordMatch,
                    validator: (reTypePasswordText) {
                      if (reTypePasswordText == null ||
                          reTypePasswordText.isEmpty) {
                        return LocaleKeys.validation_emptyField.tr();
                      }
                      if (!AppRegex.isPasswordValid(reTypePasswordText)) {
                        return LocaleKeys.validation_invalidPassword.tr();
                      }
                      if (dogOwnerProcessCubit.passwordController.text !=
                          reTypePasswordText) {
                        return LocaleKeys.validation_passwordsNotMatch.tr();
                      }
                      return null; // Validation passed
                    },
                    onChanged: (password) {
                      dogOwnerProcessCubit.updateDogOwnerProcess(
                          password: password);
                      dogOwnerProcessCubit.checkPasswordMatch();
                    },
                    enabledBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppDouble.d16)),
                      borderSide: BorderSide(
                        color: dogOwnerProcess.passwordMatch
                            ? ColorsManager.green800
                            : ColorsManager.grey200, // Default border color
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: const BorderRadius.all(
                          Radius.circular(AppDouble.d16)),
                      borderSide: BorderSide(
                        color: dogOwnerProcess.passwordMatch
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
