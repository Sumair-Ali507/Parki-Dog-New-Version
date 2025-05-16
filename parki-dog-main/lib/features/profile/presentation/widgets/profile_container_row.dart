import 'package:parki_dog/features/profile/export/profile_export.dart';

class ProfileContainerRow extends StatelessWidget {
  final String iconAsset;
  final String text;
  final String value;
  final bool isEnd;

  const ProfileContainerRow(
      {super.key,
      required this.iconAsset,
      required this.text,
      required this.value,
      this.isEnd = false});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: isEnd ? AppDouble.d0 : AppDouble.d16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            child: Row(
              children: [
                SvgIcon(
                  color: ColorsManager.grey600,
                  assetName: iconAsset,
                  width: AppDouble.d24,
                ),
                const SizedBox(width: AppDouble.d8),
                Container(
                    constraints: BoxConstraints(
                        maxWidth:
                            AppDouble.d1.sw / AppDouble.d2 - AppDouble.d70),
                    child: Text(
                      text,
                      style: TextStyles.font16Grey700Regular(),
                      overflow: TextOverflow.ellipsis,
                      maxLines: AppInt.i1,
                    ).tr()),
              ],
            ),
          ),
          Expanded(
            child: Text(
              value.capitalizeFirst(),
              style: TextStyles.font16Grey600Medium(),
              overflow: TextOverflow.ellipsis,
              maxLines: AppInt.i1,
            ),
          ),
        ],
      ),
    );
  }
}
