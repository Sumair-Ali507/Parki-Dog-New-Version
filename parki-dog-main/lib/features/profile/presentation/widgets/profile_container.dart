import 'package:parki_dog/features/profile/export/profile_export.dart';

class ProfileContainer extends StatelessWidget {
  final String title;
  final bool isEdit;
  final VoidCallback? onTap;
  final Widget child;

  const ProfileContainer(
      {super.key,
      required this.title,
      required this.isEdit,
      this.onTap,
      required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(AppDouble.d16),
      decoration: BoxDecoration(
        color: ColorsManager.grey50,
        borderRadius: BorderRadius.circular(AppDouble.d16),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                  child: Text(title,
                          maxLines: AppInt.i1,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyles.font18Grey700SemiBold())
                      .tr()),
              InkWell(
                  onTap: onTap,
                  child: isEdit
                      ? const SvgIcon(
                          color: ColorsManager.grey600,
                          assetName: ImageAssets.edit)
                      : const CircleAvatar(
                          radius: AppDouble.d12,
                          backgroundColor: ColorsManager.primary200,
                          child: SvgIcon(
                            color: ColorsManager.primaryColor,
                            assetName: ImageAssets.add,
                            height: AppDouble.d12,
                          ),
                        ))
            ],
          ),
          const SizedBox(height: AppDouble.d24),
          child
        ],
      ),
    );
  }
}
