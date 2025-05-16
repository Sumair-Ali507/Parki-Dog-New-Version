import 'package:parki_dog/features/home/export/home_export.dart';

class HomeUpperStack extends StatelessWidget {
  final String assetName;
  final String title;
  final VoidCallback? onTapped;

  const HomeUpperStack({
    super.key,
    required this.assetName,
    required this.title,
    this.onTapped,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: InkWell(
        onTap: onTapped,
        borderRadius: BorderRadius.circular(AppDouble.d16),
        child: Stack(
          children: [
            SizedBox(
              height: AppDouble.d163,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(AppDouble.d16),
                  child: ColorFiltered(
                      colorFilter: ColorFilter.mode(
                          ColorsManager.black.withOpacity(AppDouble.d0_4),
                          BlendMode.darken),
                      child: SvgPicture.asset(assetName, fit: BoxFit.cover))),
            ),
            PositionedDirectional(
                start: AppDouble.d8,
                top: AppDouble.d8,
                end: AppDouble.d8,
                child: AutoSizeText(
                  title.tr(),
                  style: TextStyles.font28WhiteBold(),
                  maxLines: 3,
                  stepGranularity: 0.1,
                )),
          ],
        ),
      ),
    );
  }
}
