import 'package:parki_dog/features/chat/export/chat_export.dart';

class SendTextField extends StatelessWidget {
  final TextEditingController? controller;
  final Function(String)? onChanged;
  final VoidCallback? sendOnTap;
  const SendTextField({
    super.key,
    this.controller,
    this.onChanged,
    this.sendOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsetsDirectional.only(
            top: AppDouble.d16,
            bottom: AppDouble.d40,
            start: AppDouble.d16,
            end: AppDouble.d16),
        decoration: ShapeDecoration(shape: const StadiumBorder(), shadows: [
          BoxShadow(
            color: ColorsManager.black.withOpacity(AppDouble.d0_13),
            blurRadius: AppDouble.d20,
            offset: const Offset(AppDouble.d5, AppDouble.d4),
          )
        ]),
        child: CustomInputField(
          controller: controller,
          onChanged: onChanged,
          hint: LocaleKeys.chat_message.tr(),
          fillColor: ColorsManager.grey50,
          suffixIcon: IconButton(
              onPressed: sendOnTap,
              icon: const SvgIcon(
                  color: ColorsManager.primaryColor,
                  assetName: ImageAssets.send)),
          border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDouble.d30),
              borderSide:
                  const BorderSide(color: ColorsManager.trans, width: 0)),
          focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDouble.d30),
              borderSide:
                  const BorderSide(color: ColorsManager.trans, width: 0)),
          enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(AppDouble.d30),
              borderSide:
                  const BorderSide(color: ColorsManager.trans, width: 0)),
        ));
  }
}
