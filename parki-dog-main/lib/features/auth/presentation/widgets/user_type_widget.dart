import 'package:parki_dog/features/auth/export/auth_export.dart';

class UserTypeWidget extends StatelessWidget {
  final bool isSelected;
  final String assetName;
  final String text;
  final VoidCallback? onTap;

  const UserTypeWidget({
    super.key,
    required this.isSelected,
    required this.assetName,
    required this.text,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDouble.d24),
      child: Container(
        width: context.width / AppDouble.d2 - AppDouble.d34,
        padding: const EdgeInsets.symmetric(
            horizontal: AppDouble.d22, vertical: AppDouble.d16),
        decoration: BoxDecoration(
            color: ColorsManager.grey50,
            borderRadius: BorderRadius.circular(AppDouble.d24),
            border: Border.all(
                color: isSelected
                    ? ColorsManager.secondaryColor
                    : ColorsManager.grey50,
                width: AppDouble.d2)),
        child: Column(
          children: [
            SvgPicture.asset(assetName),
            const SizedBox(height: AppDouble.d8),
            AutoSizeText(
              text.tr(),
              maxLines: AppInt.i1,
              stepGranularity: AppDouble.d0_1,
              overflow: TextOverflow.ellipsis,
              style: isSelected
                  ? TextStyles.font16SecondarySemiBold()
                  : TextStyles.font16NavyBlueRegular(),
            )
          ],
        ),
      ),
    );
  }
}
