import 'package:get_it/get_it.dart';
import 'package:parki_dog/core/helpers/app_preferences.dart';
import 'package:parki_dog/core/network/dio_factory.dart';
import 'package:parki_dog/features/auth/data/datasource/remote/auth_remote_data_source.dart';
import 'package:parki_dog/features/auth/data/repository/auth_repository.dart';
import 'package:parki_dog/features/auth/domain/repository/base_auth_repository.dart';
import 'package:parki_dog/features/auth/domain/use_case/forgot_password_usecase.dart';
import 'package:parki_dog/features/auth/domain/use_case/login_use_case.dart';
import 'package:parki_dog/features/auth/domain/use_case/signup_use_case.dart';
import 'package:parki_dog/features/auth/domain/use_case/verify_email_usecase.dart';
import 'package:parki_dog/features/auth/presentation/business_logic/login_cubit/login_cubit.dart';
import 'package:parki_dog/features/auth/presentation/business_logic/signup_cubit/signup_cubit.dart';
import 'package:parki_dog/features/auth/presentation/business_logic/verify_mail_cubit/verify_mail_cubit.dart';
import 'package:parki_dog/features/chat/data/datasource/remote/chat_remote_data_source.dart';
import 'package:parki_dog/features/chat/data/repository/chat_repository.dart';
import 'package:parki_dog/features/chat/domain/repository/base_chat_repository.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/create_friend_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/delete_chat_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/get_chats_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/get_messages_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/mark_chat_as_read_use_case.dart';
import 'package:parki_dog/features/chat/domain/use_case/send_messages_use_case.dart';
import 'package:parki_dog/features/chat/presentation/busniess_logic/chat_bloc/chat_bloc.dart';
import 'package:parki_dog/features/dog_owner/data/datasource/remote/dog_owner_remote_data_source.dart';
import 'package:parki_dog/features/dog_owner/data/repository/dog_owner_repository.dart';
import 'package:parki_dog/features/dog_owner/domain/repository/base_dog_owner_repository.dart';
import 'package:parki_dog/features/dog_owner/domain/use_case/submit_info_use_case.dart';
import 'package:parki_dog/features/friends/data/datasource/remote/friends_remote_data_source.dart';
import 'package:parki_dog/features/friends/data/repository/friends_repository.dart';
import 'package:parki_dog/features/friends/domain/repository/base_friends_repository.dart';
import 'package:parki_dog/features/friends/domain/use_case/get_friend_requests_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/get_friends_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/respond_to_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/send_friend_request_use_case.dart';
import 'package:parki_dog/features/friends/domain/use_case/unfriend_use_case.dart';
import 'package:parki_dog/features/friends/presentation/busniess_logic/friends_cubit.dart';
import 'package:parki_dog/features/home/data/datasource/remote/home_remote_data_source.dart';
import 'package:parki_dog/features/home/data/repository/home_repository.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';
import 'package:parki_dog/features/home/domain/use_case/check_in_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/checkout_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/get_all_parks_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/get_park_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/near_by_parks_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/park_checkins_use_case.dart';
import 'package:parki_dog/features/home/domain/use_case/profile_use_case.dart';
import 'package:parki_dog/features/home/presentation/business_logic/home_cubit/home_cubit.dart';
import 'package:parki_dog/features/notifications/data/datasource/romote/notifications_remote_data_source.dart';
import 'package:parki_dog/features/notifications/data/repository/notifications_repository.dart';
import 'package:parki_dog/features/notifications/domain/repository/base_notifications_repository.dart';
import 'package:parki_dog/features/notifications/domain/use_case/get_notifications_use_case.dart';
import 'package:parki_dog/features/notifications/domain/use_case/mark_notifications_as_read.dart';
import 'package:parki_dog/features/notifications/presentation/busniess_logic/notifications_cubit/notifications_cubit.dart';
import 'package:parki_dog/features/profile/data/datasource/remote/profile_remote_data_source.dart';
import 'package:parki_dog/features/profile/data/repository/profile_repository.dart';
import 'package:parki_dog/features/profile/domain/repository/base_profile_repository.dart';
import 'package:parki_dog/features/profile/domain/use_case/logout_usecase.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_dog_use_case.dart';
import 'package:parki_dog/features/profile/domain/use_case/update_profile_use_case.dart';
import 'package:parki_dog/features/profile/presentation/busniess_logic/edit_basic_info_cubit/edit_basic_info_cubit.dart';
import 'package:parki_dog/features/profile/presentation/busniess_logic/edit_contact_info/edit_contact_info_cubit.dart';
import 'package:parki_dog/features/profile/presentation/busniess_logic/logout/logout_cubit.dart';
import 'package:parki_dog/features/profile/presentation/busniess_logic/update_dog_cubit/update_dog_cubit.dart';
import 'package:parki_dog/features/sign_in_and_security/data/datasource/base_sign_in_and_security_remote_data_source.dart';
import 'package:parki_dog/features/sign_in_and_security/data/repository/sign_in_and_security_repository.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/repository/base_sign_in_and_security_repository.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_email_use_case.dart';
import 'package:parki_dog/features/sign_in_and_security/domain/use_case/change_password_use_case.dart';
import 'package:shared_preferences/shared_preferences.dart';

final getIt = GetIt.instance;

class ServicesLocator {
  void init() async {
    ///Dio Factory
    getIt.registerLazySingleton<DioFactory>(() => DioFactory(getIt()));

    ///App Preferences
    getIt.registerLazySingleton<AppPreferences>(() => AppPreferences(getIt()));

    ///Shared Preferences
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    getIt.registerFactory<SharedPreferences>(() => sharedPreferences);


    /// USE CASES
    getIt.registerLazySingleton(() => LoginUseCase(getIt()));
    getIt.registerLazySingleton(() => SignupUseCase(getIt()));
    getIt.registerLazySingleton(() => VerifyEmailUseCase(getIt()));
    getIt.registerLazySingleton(() => ForgotPasswordUseCase(getIt()));
    getIt.registerLazySingleton(() => SubmitInfoUseCase(getIt()));
    getIt.registerLazySingleton(() => ChangeEmailUseCase(getIt()));
    getIt.registerLazySingleton(() => ChangePasswordUseCase(getIt()));
    getIt.registerLazySingleton(() => LogoutUseCase(getIt()));
    getIt.registerLazySingleton(() => CheckInUseCase(getIt()));
    getIt.registerLazySingleton(() => CheckoutUseCase(getIt()));
    getIt.registerLazySingleton(() => GetAllParksUseCase(getIt()));
    getIt.registerLazySingleton(() => GetParkUseCase(getIt()));
    getIt.registerLazySingleton(() => NearByParksUseCase(getIt()));
    getIt.registerLazySingleton(() => ParkCheckinsUseCase(getIt()));
    getIt.registerLazySingleton(() => ProfileUseCase(getIt()));
    getIt.registerLazySingleton(() => GetFriendRequestsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetFriendsUseCase(getIt()));
    getIt.registerLazySingleton(() => RespondToRequestUseCase(getIt()));
    getIt.registerLazySingleton(() => SendFriendRequestUseCase(getIt()));
    getIt.registerLazySingleton(() => UnfriendUseCase(getIt()));
    getIt.registerLazySingleton(() => GetNotificationsUseCase(getIt()));
    getIt.registerLazySingleton(() => MarkNotificationsAsReadUseCase(getIt()));
    getIt.registerLazySingleton(() => CreateChatUseCase(getIt()));
    getIt.registerLazySingleton(() => CreateFriendChatUseCase(getIt()));
    getIt.registerLazySingleton(() => DeleteChatUseCase(getIt()));
    getIt.registerLazySingleton(() => GetChatsUseCase(getIt()));
    getIt.registerLazySingleton(() => GetMessagesUseCase(getIt()));
    getIt.registerLazySingleton(() => MarkChatAsReadUseCase(getIt()));
    getIt.registerLazySingleton(() => SendMessagesUseCase(getIt()));
    getIt.registerLazySingleton(() => UpdateProfileUseCase(getIt()));
    getIt.registerLazySingleton(() => UpdateDogUseCase(getIt()));

    /// REPOSITORIES
    getIt.registerLazySingleton<BaseAuthRepository>(
        () => AuthRepository(getIt()));
    getIt.registerLazySingleton<BaseDogOwnerRepository>(
        () => DogOwnerRepository(getIt()));
    getIt.registerLazySingleton<BaseSignInAndSecurityRepository>(
        () => SignInAndSecurityRepository(getIt()));
    getIt.registerLazySingleton<BaseProfileRepository>(
        () => ProfileRepository(getIt()));
    getIt.registerLazySingleton<BaseHomeRepository>(
        () => HomeRepository(getIt()));
    getIt.registerLazySingleton<BaseFriendsRepository>(
        () => FriendsRepository(getIt()));
    getIt.registerLazySingleton<BaseNotificationsRepository>(
        () => NotificationsRepository(getIt()));
    getIt.registerLazySingleton<BaseChatRepository>(
        () => ChatRepository(getIt()));

    ///DATA SOURCES
    getIt.registerLazySingleton<BaseAuthRemoteDataSource>(
        () => AuthRemoteDataSource());
    getIt.registerLazySingleton<BaseDogOwnerRemoteDataSource>(
        () => DogOwnerRemoteDataSource());
    getIt.registerLazySingleton<BaseSignInAndSecurityRemoteDataSource>(
        () => SignInAndSecurityRemoteDataSource());
    getIt.registerLazySingleton<BaseProfileRemoteDataSource>(
        () => ProfileRemoteDataSource());
    getIt.registerLazySingleton<BaseHomeRemoteDataSource>(
        () => HomeRemoteDataSource());
    getIt.registerLazySingleton<BaseFriendsRemoteDataSource>(
        () => FriendsRemoteDataSource());
    getIt.registerLazySingleton<BaseNotificationsRemoteDataSource>(
        () => NotificationsRemoteDataSource());
    getIt.registerLazySingleton<BaseChatRemoteDataSource>(
        () => ChatRemoteDataSource());

    /// BLOCS
    getIt.registerFactory(() => VerifyMailCubit(getIt()));
    getIt.registerFactory(() => SignupCubit(getIt()));
    getIt.registerFactory(() => LoginCubit(getIt()));
    getIt.registerFactory(() => LogoutCubit(getIt()));
    getIt.registerFactory(() => HomeCubit(getIt(), getIt()));
    getIt.registerFactory(() => FriendsCubit(getIt(), getIt()));
    getIt.registerFactory(() => NotificationsCubit(getIt(), getIt()));
    getIt.registerFactory(() => ChatBloc(getIt(),getIt(),getIt(),getIt()));
    getIt.registerFactory(() => EditContactInfoCubit(getIt()));
    getIt.registerFactory(() => EditBasicInfoCubit(getIt()));
    getIt.registerFactory(() => UpdateDogCubit(getIt()));
  }
}
