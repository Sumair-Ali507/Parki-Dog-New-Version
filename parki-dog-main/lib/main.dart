import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parki_dog/app/parki_dog.dart';
import 'package:parki_dog/core/language/language.dart';
import 'package:parki_dog/core/services/service_locator.dart';
import 'package:parki_dog/core/utils/strings_manager.dart';
import 'package:parki_dog/generated/codegen_loader.g.dart';

import 'firebase_options.dart';

/// delete all unusedImports in project ⬇️
//dart fix --apply

/// easy localization generate keys ⬇️
//dart run easy_localization:generate --source-dir ./assets/translations
//dart run easy_localization:generate --source-dir ./assets/translations -f keys -o locale_keys.g.dart
// ignore_for_file: constant_identifier_names

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Future.wait([
    EasyLocalization.ensureInitialized(),
    ScreenUtil.ensureScreenSize(),
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]),
    Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    )
  ]);
  ServicesLocator().init();
  runApp(EasyLocalization(
      supportedLocales: const [englishLocale, italianoLocale],
      fallbackLocale: const Locale(StringsManager.en),
      startLocale: const Locale(StringsManager.en),
      assetLoader: const CodegenLoader(),
      path: localizationPath,
      child: MyApp()));
}