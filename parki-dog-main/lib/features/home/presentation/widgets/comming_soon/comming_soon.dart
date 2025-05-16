import 'package:parki_dog/features/home/export/home_export.dart';

class ComingSoon extends StatelessWidget {
  const ComingSoon({super.key});

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> comingSoonItems = [
      {
        "title": LocaleKeys.home_adventures,
        'image': ImageAssets.adventures,
      },
      {
        "title": LocaleKeys.home_veterinarian,
        'image': ImageAssets.veterinarian,
      },
      {
        "title": LocaleKeys.home_trainers,
        'image': ImageAssets.trainers,
      },
      {
        "title": LocaleKeys.home_washingShops,
        'image': ImageAssets.washingShops,
      },
      {
        "title": LocaleKeys.home_adoption,
        'image': ImageAssets.adoption,
      },
      {
        "title": LocaleKeys.home_lostDogs,
        'image': ImageAssets.lostDogs,
      },
    ];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const SizedBox(height: AppDouble.d16),
        Align(
          alignment: AlignmentDirectional.centerStart,
          child: Text(
            LocaleKeys.home_comingSoon,
            textAlign: TextAlign.start,
            style: TextStyles.font18Secondary400SemiBold(),
          ).tr(),
        ),
        const SizedBox(height: AppDouble.d16),
        Wrap(
          alignment: WrapAlignment.center,
          crossAxisAlignment: WrapCrossAlignment.center,
          runAlignment: WrapAlignment.center,
          spacing: AppDouble.d16,
          runSpacing: AppDouble.d16,
          children: List.generate(
              comingSoonItems.length,
              (index) => SizedBox(
                    height: AppDouble.d218,
                    width: AppDouble.d1.sw / AppDouble.d2 - AppDouble.d26,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: AppDouble.d1.sw / AppDouble.d2 - AppDouble.d26,
                          child: ClipRRect(
                              borderRadius:
                                  BorderRadius.circular(AppDouble.d16),
                              child: ColorFiltered(
                                  colorFilter: ColorFilter.mode(
                                      ColorsManager.black
                                          .withOpacity(AppDouble.d0_35),
                                      BlendMode.darken),
                                  child: Image.asset(
                                      comingSoonItems[index]['image'],
                                      fit: BoxFit.cover))),
                        ),
                        Center(
                          child: Text(comingSoonItems[index]['title'],
                                  textAlign: TextAlign.center,
                                  style: TextStyles.font22WhiteBold())
                              .tr(),
                        )
                      ],
                    ),
                  )),
        ),
        const SizedBox(height: AppDouble.d32),
      ],
    );
  }
}
