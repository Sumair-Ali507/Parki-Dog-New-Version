import 'package:parki_dog/features/select_language/export/select_language_export.dart';

class SelectLanguageScreen extends StatelessWidget {
  const SelectLanguageScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    bool isEnglish = context.isEnglish;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text(LocaleKeys.language_appLanguage).tr(),
          leading: const BackAppBar(),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(
              horizontal: AppDouble.d16, vertical: AppDouble.d24),
          children: [
            LanguageElement(
                isSelected: isEnglish,
                code: 'En',
                onTap: !isEnglish
                    ? () {
                        changeLanguageDialog(context,
                            changeLanguageOnTap: () async {
                          Future.wait([
                            // LocalizationHelper.changeToEnglish(context),
                            LocalizationHelper.changeLanguage(context),
                            getIt.get<AppPreferences>().changeAppLanguage(),
                          ]);
                          context.pushNamedAndRemoveUntil(
                            Routes.bottomNavigationBarRoute,
                            predicate: (Route<dynamic> route) {
                              return false;
                            },
                          );
                        }, languageName: 'lingua inglese');
                      }
                    : null,
                language: LocaleKeys.localizationScreen_english),
            LanguageElement(
                isSelected: !isEnglish,
                code: 'It',
                onTap: isEnglish
                    ? () {
                        changeLanguageDialog(context,
                            changeLanguageOnTap: () async {
                          Future.wait([
                            // LocalizationHelper.changeToArabic(context),
                            LocalizationHelper.changeLanguage(context),
                            getIt.get<AppPreferences>().changeAppLanguage(),
                          ]);
                          context.pushNamedAndRemoveUntil(
                              Routes.bottomNavigationBarRoute,
                              predicate: (Route<dynamic> route) {
                            return false;
                          });
                        }, languageName: 'italian');
                      }
                    : null,
                language: LocaleKeys.localizationScreen_italiano),
          ],
        ),
      ),
    );
  }
}
