import 'package:parki_dog/features/home/export/home_export.dart';

class HomeAppBarIcon extends StatelessWidget {
  final bool isRedCircle;
  final VoidCallback? onTap;
  final String svgAssetName;

  const HomeAppBarIcon({
    super.key,
    this.onTap,
    required this.svgAssetName,
    this.isRedCircle = false,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDouble.d20),
      child: Container(
        height: AppDouble.d40,
        width: AppDouble.d40,
        decoration: const BoxDecoration(
            color: ColorsManager.primary100, shape: BoxShape.circle),
        child: IconButton(
            onPressed: null,
            icon: Badge(
                isLabelVisible: isRedCircle,
                child: SvgPicture.asset(svgAssetName))),
      ),
    );
  }
}
