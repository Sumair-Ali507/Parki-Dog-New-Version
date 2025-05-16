import 'dart:async';

import 'package:flutter_svg/flutter_svg.dart';
import 'package:parki_dog/core/helpers/app_preferences.dart';
import 'package:parki_dog/core/routes/routes_manager.dart';
import 'package:parki_dog/core/services/service_locator.dart';
import 'package:parki_dog/core/utils/assets_manager.dart';
import 'package:parki_dog/core/utils/colors_manager.dart';
import 'package:parki_dog/core/utils/text_styles.dart';
import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';
import 'package:parki_dog/features/splash/presentation/widgets/zigzag_animation.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkTokenAndNavigate();
  }

  Future<void> _checkTokenAndNavigate() async {
    // Retrieve token from AppPreferences
    final token = await getIt.get<AppPreferences>().getSecuredString(userToken);

    // Delay for the splash screen animation
    await Future.delayed(const Duration(seconds: AppInt.i4));

    // Check if the widget is still mounted before navigating
    if (!mounted) return;

    // Navigate based on token existence
    if (token.isNotEmpty) {
      Navigator.pushReplacementNamed(context, Routes.bottomNavigationBarRoute);
    } else {
      Navigator.pushReplacementNamed(context, Routes.loginRoute);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: ColorsManager.white,
      body: Stack(
        children: [
          const ZigzagAnimation(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SvgPicture.asset(ImageAssets.logoSvg),
                const SizedBox(height: AppDouble.d24),
                Text(
                  'Loading...',
                  style: TextStyles.font16Primary600SemiBold(),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
