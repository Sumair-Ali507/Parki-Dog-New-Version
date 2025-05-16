import 'package:parki_dog/features/auth/export/auth_export.dart';

class PasswordInputField extends StatelessWidget {
  final String? Function(String?)? validator;
  final String hint;
  final String? label;
  final TextEditingController? controller;
  final InputBorder? focusedBorder;
  final InputBorder? enabledBorder;
  final InputBorder? border;
  final Function(String)? onChanged;
  final bool isPasswordsMatches;
  final TextStyle? labelStyle;
  final String? helperText;
  const PasswordInputField(
      {super.key,
      this.validator,
      required this.hint,
      this.label,
      this.controller,
      this.focusedBorder,
      this.enabledBorder,
      this.border,
      this.onChanged,
      this.isPasswordsMatches = false,
      this.labelStyle,
      this.helperText});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => PasswordVisibilityCubit(),
      child: BlocBuilder<PasswordVisibilityCubit, bool>(
        builder: (passwordVisibilityContext, state) {
          return CustomInputField(
            hint: hint,
            label: label,
            controller: controller,
            validator: validator,
            focusedBorder: focusedBorder,
            enabledBorder: enabledBorder,
            helperText: helperText,
            border: border,
            labelStyle: labelStyle,
            onChanged: onChanged,
            textInputType: TextInputType.visiblePassword,
            obscureText: passwordVisibilityContext
                .select((PasswordVisibilityCubit cubit) => !cubit.state),
            suffixIcon: IconButton(
              onPressed: () {
                passwordVisibilityContext
                    .read<PasswordVisibilityCubit>()
                    .toggleVisibility();
              },
              icon: isPasswordsMatches
                  ? const AppIcon(
                      assetName: ImageAssets.checkFilled,
                      color: ColorsManager.green800,
                    )
                  : AppIcon(
                      assetName: passwordVisibilityContext.select(
                          (PasswordVisibilityCubit cubit) => cubit.state
                              ? ImageAssets.eyeOff
                              : ImageAssets.eye),
                      color: ColorsManager.grey200,
                    ),
            ),
          );
        },
      ),
    );
  }
}
