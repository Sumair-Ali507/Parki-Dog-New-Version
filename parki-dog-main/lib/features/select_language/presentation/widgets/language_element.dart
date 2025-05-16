import 'package:parki_dog/features/select_language/export/select_language_export.dart';

//modify styles and colos
class LanguageElement extends StatelessWidget {
  final bool isSelected;
  final VoidCallback? onTap;
  final String language;
  final String code;
  const LanguageElement({
    super.key,
    required this.isSelected,
    required this.onTap,
    required this.language,
    required this.code,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: AppDouble.d16),
        decoration: const BoxDecoration(
            border: BorderDirectional(
                bottom: BorderSide(
                    color: ColorsManager.grey100, width: AppDouble.d1))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                CircleAvatar(
                    backgroundColor: ColorsManager.grey100,
                    radius: AppDouble.d20,
                    child: Text(
                      code,
                      style: TextStyles.font18Grey600SemiBoldRoboto(),
                    )),
                const SizedBox(width: AppDouble.d11),
                Text(
                  language,
                  style: TextStyles.font14Grey600Medium(),
                ).tr(),
              ],
            ),
            Container(
              height: AppDouble.d24,
              width: AppDouble.d24,
              padding: const EdgeInsets.all(AppDouble.d5),
              decoration: BoxDecoration(
                  color: Colors.white,
                  shape: BoxShape.circle,
                  border: Border.all(
                      width: AppDouble.d2,
                      color: isSelected
                          ? ColorsManager.primaryColor
                          : ColorsManager.grey300)),
              child: isSelected
                  ? const CircleAvatar(
                      radius: AppDouble.d4_5,
                      backgroundColor: ColorsManager.primaryColor,
                    )
                  : const SizedBox(),
            )
          ],
        ),
      ),
    );
  }
}
