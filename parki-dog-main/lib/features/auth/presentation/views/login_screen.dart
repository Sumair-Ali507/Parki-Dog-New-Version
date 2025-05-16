import 'package:parki_dog/features/auth/export/auth_export.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: BlocProvider(
          create: (context) => LoginCubit(getIt.get()),
          child: BlocConsumer<LoginCubit, LoginState>(
            listener: (loginContext, loginState) {
              if (loginState.isError) {
                showTopSnackBar(context,
                    message: loginState.error ??
                        LocaleKeys.paginatedListView_somethingWentWrong.tr(),
                    isGreen: false);
              }
              if (loginState.isSuccess) {
                showTopSnackBar(context,
                    message: LocaleKeys.auth_loggedInSuccessfully.tr());
              }
            },
            builder: (loginContext, loginState) {
              LoginCubit loginCubit = loginContext.read<LoginCubit>();
              return Form(
                key: loginCubit.formKey,
                child: ListView(
                  padding: const EdgeInsets.symmetric(
                      vertical: AppDouble.d32, horizontal: AppDouble.d24),
                  children: [
                    SvgPicture.asset(ImageAssets.logoSvg),
                    const SizedBox(height: AppDouble.d48),
                    Text(
                      LocaleKeys.auth_welcome_back,
                      style: TextStyles.font24Grey600SemiBold(),
                      textAlign: TextAlign.center,
                    ).tr(),
                    const SizedBox(height: AppDouble.d32),
                    CustomInputField(
                      hint: LocaleKeys.auth_emailHint.tr(),
                      label: LocaleKeys.auth_email.tr(),
                      controller: loginCubit.emailController,
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
                      label: LocaleKeys.auth_password.tr(),
                      controller: loginCubit.passwordController,
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
                    const SizedBox(height: AppDouble.d8),
                    Align(
                      alignment: AlignmentDirectional.centerStart,
                      child: TextButton(
                          onPressed: () {
                            context.pushNamed(Routes.forgotPasswordRoute);
                          },
                          child: Text(
                            LocaleKeys.auth_forgotPassword,
                            style: TextStyles.font12PrimaryRegular(),
                          ).tr()),
                    ),
                    const SizedBox(height: AppDouble.d48),
                    loginState.isLoading
                        ? const Center(child: CircularProgressIndicator())
                        : ElevatedButton(
                            onPressed: () => loginCubit.login(context),
                            child: const Text(LocaleKeys.auth_login).tr()),
                    const LoginDivider(),
                    SocialLogin(facebookOnPressed: () {
                      loginCubit.login(context, isFacebookLogin: true);
                    }, googleOnPressed: () {
                      loginCubit.login(context, isGoogleSignIn: true);

                      // loginCubit.login(isGoogleSignIn: true);
                    }),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      runAlignment: WrapAlignment.center,
                      direction: Axis.horizontal,
                      spacing: AppDouble.d4,
                      runSpacing: AppDouble.d8,
                      children: [
                        Text(
                          LocaleKeys.auth_notHaveAccount,
                          style: TextStyles.font12Grey600SemiBold(),
                        ).tr(),
                        TextButton(
                            onPressed: () {
                              context.pushNamed(Routes.signupRoute);
                            },
                            child: const Text(LocaleKeys.auth_signUp).tr())
                      ],
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
