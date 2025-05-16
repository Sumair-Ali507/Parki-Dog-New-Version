import 'package:flutter_svg/svg.dart';
import 'package:parki_dog/features/map/export/map_export.dart';

// import 'package:parki_dog/features/auth/login/export/auth_export.dart';

class CustomMarker extends StatelessWidget {
  final String title;
  final bool isSafe;
  final String assetName;
  const CustomMarker({
    super.key,
    required this.title,
    this.isSafe = true,
    this.assetName = ImageAssets.parkiPin,
    // this.assetName = ImageAssets.petOutlined,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SvgPicture.asset(
          assetName,
          height: 50,
          // width: width,
        ),
        const SizedBox(height: AppDouble.d4),
        Text(
          title,
          style: TextStyle(
              fontSize: AppDouble.d14,
              fontWeight: FontWeight.w700,
              color: Colors.black,
              shadows: [
                Shadow(
                  color: ColorsManager.white.withOpacity(AppDouble.d0_6),
                  blurRadius: AppDouble.d6,
                  offset: const Offset(AppDouble.d0, AppDouble.d0),
                ),
              ]),
        ),
        const SizedBox(height: AppDouble.d8),
        isSafe
            ? Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d4, horizontal: AppDouble.d8),
                decoration: BoxDecoration(
                  color: ColorsManager.green100,
                  borderRadius: BorderRadius.circular(AppDouble.d8),
                ),
                child: Text(
                  LocaleKeys.checkIn_safe,
                  style: TextStyles.font12Green800Medium(),
                ).tr(),
              )
            : Container(
                padding: const EdgeInsets.symmetric(
                    vertical: AppDouble.d4, horizontal: AppDouble.d8),
                decoration: BoxDecoration(
                  color: ColorsManager.red100,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Text(
                  LocaleKeys.checkIn_unsafe,
                  style: TextStyles.font12Green800Medium(
                      color: ColorsManager.red600),
                ).tr(),
              ),
      ],
    );
  }
}
