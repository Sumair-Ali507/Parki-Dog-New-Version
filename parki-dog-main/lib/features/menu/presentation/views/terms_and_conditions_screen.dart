import 'package:parki_dog/features/menu/data/hard_string/terms_and_conditions_content.dart';
import 'package:parki_dog/features/menu/export/menu_export.dart';

class TermsAndConditionsScreen extends StatelessWidget {
  const TermsAndConditionsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(LocaleKeys.menu_termsAndConditions).tr(),
        leading: const BackAppBar(),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(AppDouble.d16),
        itemCount: termsAndConditionsContentEnglish.length,
        itemBuilder: (context, index) => TermsAndConditionItem(
            title: context.isEnglish
                ? termsAndConditionsContentEnglish[index]['title'] ?? ''
                : termsAndConditionsContentItalian[index]['title'] ?? '',
            description: context.isEnglish
                ? termsAndConditionsContentEnglish[index]['content'] ?? ''
                : termsAndConditionsContentItalian[index]['content'] ?? ''),
      ),
    );
  }
}
