import 'package:parki_dog/app/app_export.dart';
import 'package:parki_dog/core/shared_widgets/back_app_bar.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:parki_dog/features/sign_in_and_security/presentation/widgets/sign_in_and_security_item.dart';
import 'package:parki_dog/generated/locale_keys.g.dart';

class SignInAndSecurityScreen extends StatelessWidget {
  const SignInAndSecurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.signInAndSecurity_singInAndSecurity).tr(),
        leading: const BackAppBar(),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(
          horizontal: AppDouble.d16,
          vertical: AppDouble.d32,
        ),
        children: [
          SignInAndSecurityItem(
            isPassword: false,
            imageAsset: ImageAssets.mail,
            title: LocaleKeys.signInAndSecurity_emailAddress,
            mail: 'ahmednafee361@gmail.com',
            onTap: () {
              context.pushNamed(Routes.changeEmailRoute);
            },
          ),
          SignInAndSecurityItem(
            isPassword: true,
            imageAsset: ImageAssets.password,
            title: LocaleKeys.signInAndSecurity_password,
            date: '02/03/2024 ',
            onTap: () {
              context.pushNamed(Routes.changePasswordRoute);
            },
          ),
        ],
      ),
    );
  }
}
