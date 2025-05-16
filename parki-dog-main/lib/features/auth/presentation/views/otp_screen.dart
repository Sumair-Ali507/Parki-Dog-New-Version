import 'package:parki_dog/features/auth/export/auth_export.dart';
import 'package:parki_dog/features/auth/presentation/business_logic/pin_code_cubit/pin_code_cubit.dart';
import 'package:parki_dog/features/auth/presentation/widgets/pin_code_custom_field.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    String number = "+44 838 42842";
    return BlocProvider(
      create: (context) => PinCodeCubit(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackAppBar(),
          title: const Text(LocaleKeys.auth_forgotPasswordAppBar).tr(),
        ),
        bottomNavigationBar: Padding(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDouble.d16, vertical: AppDouble.d32),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    onPressed: () {
                      context.pushNamed(Routes.bottomNavigationBarRoute);
                    },
                    child: const Text(LocaleKeys.auth_confirm).tr()),
              ),
              const SizedBox(height: AppDouble.d14),
              SizedBox(
                  width: double.infinity,
                  child: TextButton(
                      onPressed: () {},
                      child: Text(
                        LocaleKeys.auth_resend,
                        style: TextStyles.font16PrimaryMedium(),
                      ).tr()))
            ],
          ),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(horizontal: AppDouble.d16),
          children: [
            Text(LocaleKeys.auth_fourDigitSent,
                    style: TextStyles.font24GreyDarkRegular(),
                    textAlign: TextAlign.center)
                .tr(),
            const SizedBox(height: 4),
            Text(number,
                style: TextStyles.font16Grey500Regular(),
                textAlign: TextAlign.center),
            const SizedBox(height: 12),
            TextButton(
                onPressed: () {},
                child: Text(LocaleKeys.auth_changeNumber,
                        style: TextStyles.font14PrimaryUnderLineRegular())
                    .tr()),
            const SizedBox(height: 32),
            const PinCodeCustomWidget(),
          ],
        ),
      ),
    );
  }
}
