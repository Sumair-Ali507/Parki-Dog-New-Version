import 'package:flutter/material.dart';
import 'package:parki_dog/core/routes/routes_export.dart';
import 'package:parki_dog/features/chat/data/models/chat_data.dart';
import 'package:parki_dog/features/chat/presentation/busniess_logic/chat_bloc/chat_bloc.dart';
import 'package:parki_dog/features/map/presentation/views/check_in_screen.dart';
import 'package:parki_dog/features/map/presentation/views/map_screen.dart';
import 'package:parki_dog/features/profile/presentation/views/edit_basic_info_screen.dart';
import 'package:parki_dog/features/profile/presentation/views/edit_contact_info_screen.dart';
import 'package:parki_dog/features/profile/presentation/views/update_dog_screen.dart';

class Routes {
  static const String initialRoute = '/';
  static const String startRoute = '/startRoute';
  static const String splashRoute = '/splashRoute';
  static const String loginRoute = '/loginRoute';
  static const String signupRoute = '/signupRoute';
  static const String forgotPasswordRoute = '/forgotPasswordRoute';
  static const String otpRoute = '/otpRoute';
  static const String userTypeRoute = '/userTypeRoute';
  static const String dogOwnerBasicInfoRoute = '/dogOwnerBasicInfoRoute';
  static const String dogOwnerDogInfoRoute = '/dogOwnerDogInfoRoute';
  static const String dogUnSociabilityRoute = '/dogUnSociabilityRoute';
  static const String selectLanguageRoute = '/selectLanguageRoute';
  static const String bottomNavigationBarRoute = '/bottomNavigationBarRoute';
  static const String homeRoute = '/homeRoute';
  static const String howWorksRoute = '/howWorksRoute';
  static const String ourMissionScreenRoute = '/ourMissionScreenRoute';
  static const String friendsRoute = '/friendsRoute';
  static const String blockListRoute = '/blockListRoute';
  static const String notificationsRoute = '/notificationsRoute';
  static const String chatRoute = '/chatRoute';
  static const String menuRoute = '/menuRoute';
  static const String chatRoomRoute = '/chatRoomRoute';
  static const String checkInRoute = '/checkInRoute';
  static const String termsAndConditionsRoute = '/termsAndConditionsRoute';
  static const String signInAndSecurityRoute = '/signInAndSecurityRoute';
  static const String changeEmailRoute = '/changeEmailRoute';
  static const String changePasswordRoute = '/changePasswordRoute';
  static const String profileRoute = '/profileRoute';
  static const String mapRoute = '/mapRoute';
  static const String verifyEmailRoute = '/verifyEmailRoute';
  static const String editBasicProfileRoute = '/editBasicProfileRoute';
  static const String editContactProfileRoute = '/editContactProfileRoute';
  static const String updateDogRoute = '/updateDogRoute';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    final args = settings.arguments;

    switch (settings.name) {
      case Routes.initialRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());

      case Routes.loginRoute:
        return MaterialPageRoute(builder: (_) => const LoginScreen());

      case Routes.signupRoute:
        return MaterialPageRoute(builder: (_) => const SignupScreen());

      case Routes.forgotPasswordRoute:
        return MaterialPageRoute(builder: (_) => const ForgotPasswordScreen());

      case Routes.otpRoute:
        return MaterialPageRoute(builder: (_) => const OtpScreen());

      case Routes.userTypeRoute:
        return MaterialPageRoute(
            builder: (_) => UserTypeScreen(
                  dogOwnerProcessCubit: args as DogOwnerProcessCubit,
                ));

      case Routes.dogOwnerBasicInfoRoute:
        return MaterialPageRoute(
            builder: (_) => DogOwnerBasicInfoScreen(
                  dogOwnerProcessCubit: args as DogOwnerProcessCubit,
                ));

      case Routes.dogOwnerDogInfoRoute:
        return MaterialPageRoute(
            builder: (_) => DogOwnerDogInfoScreen(
                  dogOwnerProcessCubit: args as DogOwnerProcessCubit,
                ));

      case Routes.dogUnSociabilityRoute:
        return MaterialPageRoute(
            builder: (_) => DogUnSociabilityScreen(
                  dogOwnerProcessCubit: args as DogOwnerProcessCubit,
                ));

      case Routes.friendsRoute:
        return MaterialPageRoute(builder: (_) => const FriendsScreen());

      case Routes.blockListRoute:
        return MaterialPageRoute(builder: (_) => const BlockListScreen());

      case Routes.selectLanguageRoute:
        return MaterialPageRoute(builder: (_) => const SelectLanguageScreen());

      case Routes.homeRoute:
        return MaterialPageRoute(
            builder: (_) => HomeScreen(
                  parks: args as List<Park>,
                ));

      case Routes.ourMissionScreenRoute:
        return MaterialPageRoute(builder: (_) => const OurMissionScreen());

      case Routes.howWorksRoute:
        return MaterialPageRoute(builder: (_) => const HowWorksScreen());

      case Routes.notificationsRoute:
        return MaterialPageRoute(builder: (_) => const NotificationsScreen());

      case Routes.chatRoute:
        return MaterialPageRoute(builder: (_) => const ChatScreen());

      case Routes.menuRoute:
        return MaterialPageRoute(builder: (_) => const MenuScreen());

      case Routes.chatRoomRoute:
        final args = settings.arguments as Map<String, dynamic>;
        return MaterialPageRoute(
            builder: (_) => ChatRoomScreen(
                  chatData: args['chatData'] as ChatData,
                  chatBloc: args['chatBloc'] as ChatBloc,
                ));

      case Routes.checkInRoute:
        final argsMap = args as Map<String, dynamic>? ?? {};
        return MaterialPageRoute(
          builder: (_) => CheckInScreen(
            parkName: argsMap['parkName'] as String? ?? 'Dog Park',
            location: argsMap['location'] as String? ?? 'Unknown Location',
            imageUrls: argsMap['imageUrls'] as List<String>? ?? [],
            distance: argsMap['distance'] as String? ?? '0km',
            time: argsMap['time'] as String? ?? '0m',
            duration: argsMap['duration'] as String? ?? '24 hours',
            isOpenNow: argsMap['isOpenNow'] as bool? ?? true,
            rating: argsMap['rating'] as int? ?? 5,
            ratingCount: argsMap['ratingCount'] as int? ?? 12,
            reviews: argsMap['reviews'] as List<Map<String, dynamic>>? ?? [],
          ),
        );

      case Routes.verifyEmailRoute:
        return MaterialPageRoute(builder: (_) => const VerifyEmailScreen());

      case Routes.signInAndSecurityRoute:
        return MaterialPageRoute(builder: (_) => const SignInAndSecurityScreen());

      case Routes.changeEmailRoute:
        return MaterialPageRoute(builder: (_) => const ChangeEmailScreen());

      case Routes.changePasswordRoute:
        return MaterialPageRoute(builder: (_) => const ChangePasswordScreen());

      case Routes.termsAndConditionsRoute:
        return MaterialPageRoute(builder: (_) => const TermsAndConditionsScreen());

      case Routes.editBasicProfileRoute:
        return MaterialPageRoute(
            builder: (_) => EditBasicInfoScreen(
                  profile: args as Profile,
                ));

      case Routes.editContactProfileRoute:
        return MaterialPageRoute(
            builder: (_) => EditContactInfoScreen(
                  profile: args as Profile,
                ));

      case Routes.profileRoute:
        return MaterialPageRoute(
            builder: (_) => ProfileScreen(
                  profile: args as Profile,
                ));

      case Routes.updateDogRoute:
        return MaterialPageRoute(
            builder: (_) => UpdateDogScreen(
                  profile: args as Profile,
                ));

      case Routes.mapRoute:
        return MaterialPageRoute(
            builder: (_) => MapScreen(
                  isOnlyDetermineLocation: args as bool?,
                ));

      case Routes.bottomNavigationBarRoute:
        return MaterialPageRoute(builder: (_) => const BottomNavigationBarScreen());

      default:
        return MaterialPageRoute(
            builder: (_) => const Scaffold(
                  body: Center(child: Text('Route not found')),
                ));
    }
  }
}