import 'package:parki_dog/features/auth/export/auth_export.dart';

class SocialLogin extends StatelessWidget {
  final VoidCallback? googleOnPressed;
  final VoidCallback? facebookOnPressed;

  const SocialLogin({
    super.key,
    this.googleOnPressed,
    this.facebookOnPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        OutlinedButton(
            onPressed: googleOnPressed,
            child: Row(
              children: [
                SvgPicture.asset(ImageAssets.google),
                const SizedBox(width: AppDouble.d8),
                const Text(LocaleKeys.auth_google).tr(),
              ],
            )),
        const Flexible(
            fit: FlexFit.loose, child: SizedBox(width: AppDouble.d8)),
        OutlinedButton(
            onPressed: facebookOnPressed,
            child: Row(
              children: [
                SvgPicture.asset(ImageAssets.facebook),
                const SizedBox(width: AppDouble.d8),
                const Text(LocaleKeys.auth_facebook).tr(),
              ],
            )),
      ],
    );
  }
}
