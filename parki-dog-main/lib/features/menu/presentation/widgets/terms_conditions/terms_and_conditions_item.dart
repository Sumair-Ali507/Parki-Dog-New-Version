import 'package:parki_dog/features/menu/export/menu_export.dart';

class TermsAndConditionItem extends StatelessWidget {
  final String title;
  final String description;
  const TermsAndConditionItem({
    super.key,
    required this.title,
    required this.description,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: AppDouble.d16),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              title,
              style: TextStyles.font16Grey600SemiBold(),
            ),
            const SizedBox(height: AppDouble.d8),
            Text(
              description,
              style: TextStyles.font14Grey400Medium(),
            )
          ]),
    );
  }
}
