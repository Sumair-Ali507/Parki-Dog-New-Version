import 'package:parki_dog/features/home/export/home_export.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  ProfileUseCase profileUseCase;
  GetAllParksUseCase allParksUseCase;

  HomeCubit(this.profileUseCase, this.allParksUseCase)
      : super(const HomeState());

  homeInit() async {
    emit(state.copyWith(status: HomeStatus.loading));

    final results = await Future.wait([
      profileUseCase(const NoParameters()),
      allParksUseCase(const NoParameters()),
    ]);

    // Extract the results of the calls
    final profileResult = results[0] as (Failure?, ProfileResponse?);
    final parksResult = results[1] as (Failure?, AllParksResponse?);

    // Handle errors and successes
    if (profileResult.$1 != null) {
      emit(state.copyWith(
        status: HomeStatus.error,
        error: profileResult.$1!.message.tr(),
      ));
    } else if (parksResult.$1 != null) {
      emit(state.copyWith(
        status: HomeStatus.error,
        error: parksResult.$1!.message.tr(),
      ));
    } else {
      emit(state.copyWith(
        status: HomeStatus.success,
        profile: profileResult.$2?.profile,
        parks: parksResult.$2?.parks,
      ));
    }
  }
}
