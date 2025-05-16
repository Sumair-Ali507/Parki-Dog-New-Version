import 'package:parki_dog/features/auth/export/auth_export.dart';

class VerifyEmailScreen extends StatelessWidget {
  const VerifyEmailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => VerifyMailCubit(getIt.get()),
      child: BlocConsumer<VerifyMailCubit, VerifyMailState>(
        listener: (verifyMailContext, verifyMailState) {
          if (verifyMailState.isError) {
            showTopSnackBar(context,
                message: LocaleKeys.paginatedListView_somethingWentWrong.tr(),
                isGreen: false);
          }
          if (verifyMailState.isSuccess) {
            showTopSnackBar(context,
                message: LocaleKeys.auth_successYouCanLogin.tr());
            context.pushNamedAndRemoveUntil(Routes.loginRoute,
                predicate: (route) => false);
          }
        },
        builder: (verifyMailContext, verifyMailState) {
          VerifyMailCubit verifyMailCubit =
              verifyMailContext.read<VerifyMailCubit>();
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              title: const Text(LocaleKeys.auth_verifyEmail).tr(),
            ),
            bottomNavigationBar: Padding(
              padding: const EdgeInsets.symmetric(
                  horizontal: AppDouble.d24, vertical: AppDouble.d32),
              child: verifyMailState.isLoading
                  ? const SizedBox(
                      height: AppDouble.d56,
                      child: Center(child: CircularProgressIndicator()))
                  : ElevatedButton(
                      onPressed: () {
                        if (verifyMailCubit.formKey.currentState!.validate()) {
                          verifyMailCubit.verifyEmail(context);
                        }
                      },
                      child: const Text(LocaleKeys.auth_submit).tr()),
            ),
            body: Form(
              key: verifyMailCubit.formKey,
              child: ListView(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d32, horizontal: AppDouble.d24),
                children: [
                  Text(
                    LocaleKeys.auth_writeCode,
                    textAlign: TextAlign.center,
                    style: TextStyles.font14Grey400Regular(),
                  ).tr(),
                  SizedBox(height: AppDouble.d16.h),
                  CustomInputField(
                      hint: LocaleKeys.auth_enterCode.tr(),
                      label: LocaleKeys.auth_code.tr(),
                      controller: verifyMailCubit.codeController,
                      validator: validateRequiredField),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
