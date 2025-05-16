import 'package:parki_dog/features/home/export/home_export.dart';

class TellFeedBack extends StatelessWidget {
  const TellFeedBack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    List<String> emojis = [
      ImageAssets.happyEmoji,
      ImageAssets.loveEmoji,
      ImageAssets.angryEmoji,
    ];
    return Container(
      padding: const EdgeInsets.all(AppDouble.d24),
      decoration: BoxDecoration(
          color: ColorsManager.yellowLight,
          borderRadius: BorderRadius.circular(AppDouble.d24)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(LocaleKeys.home_tellUs,
                  style: TextStyles.font18Secondary400SemiBold())
              .tr(),
          const SizedBox(height: AppDouble.d28),
          Wrap(
            alignment: WrapAlignment.center,
            runAlignment: WrapAlignment.center,
            crossAxisAlignment: WrapCrossAlignment.center,
            spacing: AppDouble.d24,
            runSpacing: AppDouble.d24,
            children: List.generate(
                emojis.length, (index) => SvgPicture.asset(emojis[index])),
          )
        ],
      ),
    );
  }
}
