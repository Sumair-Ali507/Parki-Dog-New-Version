import 'package:parki_dog/features/menu/export/menu_export.dart';

class MenuItem extends StatelessWidget {
  final VoidCallback? onTap;
  final String assetName;
  final String title;

  const MenuItem({
    super.key,
    this.onTap,
    required this.assetName,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDouble.d16),
      child: InkWell(
        borderRadius: BorderRadius.circular(AppDouble.d16),
        onTap: onTap,
        child: MenuContainer(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  SvgIcon(
                    assetName: assetName,
                    color: ColorsManager.grey600,
                    height: AppDouble.d24,
                  ),
                  const SizedBox(
                    width: AppDouble.d10,
                  ),
                  Flexible(
                    child: SizedBox(
                      width: AppDouble.d1.sw - AppDouble.d120,
                      child: Text(title,
                              maxLines: AppInt.i1,
                              overflow: TextOverflow.ellipsis,
                              style: TextStyles.font16Grey600SemiBold())
                          .tr(),
                    ),
                  )
                ],
              ),
              const SvgIcon(
                assetName: ImageAssets.forward,
                color: ColorsManager.grey400,
                height: AppDouble.d14,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
