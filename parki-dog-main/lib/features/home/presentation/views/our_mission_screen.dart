import 'package:parki_dog/features/home/export/home_export.dart';

class OurMissionScreen extends StatelessWidget {
  const OurMissionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.all(24),
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  height: AppDouble.d265,
                  width: double.infinity,
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(AppDouble.d16),
                      child: ColorFiltered(
                          colorFilter: ColorFilter.mode(
                              ColorsManager.black.withOpacity(AppDouble.d0_4),
                              BlendMode.darken),
                          child: SvgPicture.asset(ImageAssets.ourMissionSvg,
                              fit: BoxFit.cover))),
                ),
                Center(
                  child: Text(LocaleKeys.home_ourMission,
                          textAlign: TextAlign.center,
                          style: TextStyles.font40WhiteBold())
                      .tr(),
                ),
                PositionedDirectional(
                    start: AppDouble.d8,
                    top: AppDouble.d8,
                    child: InkWell(
                      onTap: () {
                        context.pop();
                      },
                      child: CircleAvatar(
                          radius: AppDouble.d20,
                          backgroundColor: ColorsManager.primary100,
                          child: SvgPicture.asset(ImageAssets.back)),
                    )),
              ],
            ),
            ...List.generate(
                ourMissionContentEnglish.length,
                (index) => OurMissionHowItWorksComponent(
                      title: context.isEnglish
                          ? ourMissionContentEnglish[index]['title'] ?? ''
                          : ourMissionContentItalian[index]['title'] ?? '',
                      content: context.isEnglish
                          ? ourMissionContentEnglish[index]['content'] ?? ''
                          : ourMissionContentItalian[index]['content'] ?? '',
                    )),
          ],
        ),
      ),
    );
  }
}



