import 'package:parki_dog/features/home/export/home_export.dart';

class HowWorksMissionRow extends StatelessWidget {
  final VoidCallback? missionOnTap;
  final VoidCallback? howWorks;

  const HowWorksMissionRow({
    super.key,
    this.missionOnTap,
    this.howWorks,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        HomeUpperStack(
          assetName: ImageAssets.ourMissionSvg,
          title: LocaleKeys.home_ourMission,
          onTapped: missionOnTap,
        ),
        const SizedBox(width: AppDouble.d16),
        HomeUpperStack(
          assetName: ImageAssets.howItWorksSvg,
          title: LocaleKeys.home_howItWorks,
          onTapped: howWorks,
        ),
      ],
    );
  }
}
