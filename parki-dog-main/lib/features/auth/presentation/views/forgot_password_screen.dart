import 'package:parki_dog/features/auth/export/auth_export.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ForgotPasswordCubit(getIt.get()),
      child: BlocBuilder<ForgotPasswordCubit, ForgotPasswordState>(
        builder: (forgotPasswordContext, forgotPasswordState) {
          ForgotPasswordCubit forgotPasswordCubit =
              forgotPasswordContext.read<ForgotPasswordCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              title: const Text(LocaleKeys.auth_forgotPasswordAppBar).tr(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDouble.d24, vertical: AppDouble.d32),
              child: ElevatedButton(
                  onPressed: () => forgotPasswordCubit.forgotPassword(context),
                  child: const Text(LocaleKeys.auth_submit).tr()),
            ),
            body: Form(
              key: forgotPasswordCubit.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d32, horizontal: AppDouble.d24),
                children: [
                  CustomInputField(
                      hint: LocaleKeys.auth_phoneNumberHint.tr(),
                      label: LocaleKeys.auth_phoneNumber.tr(),
                      controller: forgotPasswordCubit.phoneController,
                      textInputType: TextInputType.phone,
                      validator: (phoneNumber) {
                        if (phoneNumber == null || phoneNumber.isEmpty) {
                          return LocaleKeys.validation_emptyField.tr();
                        }
                        return null;
                      },
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.allow(RegExp(r'[0-9+]'))
                      ]),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
