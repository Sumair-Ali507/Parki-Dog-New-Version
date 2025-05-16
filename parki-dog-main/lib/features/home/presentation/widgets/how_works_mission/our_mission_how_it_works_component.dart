import 'package:parki_dog/features/home/export/home_export.dart';

class OurMissionHowItWorksComponent extends StatelessWidget {
  final String title;
  final String content;

  const OurMissionHowItWorksComponent({
    super.key,
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyles.font18BlackBold(),
            textAlign: TextAlign.start,
          ),
          const SizedBox(height: AppDouble.d16),
          Text(
            content,
            style: TextStyles.font14Grey400Regular(),
            textAlign: TextAlign.start,
          ),
        ],
      ),
    );
  }
}