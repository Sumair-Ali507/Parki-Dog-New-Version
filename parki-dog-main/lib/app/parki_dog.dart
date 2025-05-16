 import 'package:parki_dog/app/app_export.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:parki_dog/core/routes/routes_manager.dart';
import 'package:parki_dog/core/services/service_locator.dart';
//import 'package:parki_dog/core/utils/app_constants.dart';
import 'package:parki_dog/core/utils/strings_manager.dart';
//import 'package:parki_dog/features/bottom_navigation/business_logic/bottom_navigation_cubit.dart';
//import 'package:parki_dog/core/theme/theme.dart';

// Global Navigator Key for navigation
final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp._internal();

  static const MyApp _instance = MyApp._internal();

  factory MyApp() => _instance;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppPreferences _appPreferences = getIt.get<AppPreferences>();

  @override
  void didChangeDependencies() async {
    _appPreferences.getLocale().then((locale) {
      if (mounted) {
        context.setLocale(locale);
      }
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize:
            Size(AppConstants.appWidthPixels, AppConstants.appHeightPixels),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) => BlocProvider(
              create: (context) => BottomNavigationCubit(),
              child: MaterialApp(
                navigatorKey: navigatorKey,
                localizationsDelegates: context.localizationDelegates,
                supportedLocales: context.supportedLocales,
                locale: context.locale,
                title: StringsManager.appName,
                debugShowCheckedModeBanner: false,
                theme: getApplicationTheme(),
                onGenerateRoute: RouteGenerator.getRoute,
                initialRoute: Routes.initialRoute,
              ),
            ));
  }
}