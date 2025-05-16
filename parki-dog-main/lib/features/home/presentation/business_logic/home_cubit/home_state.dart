part of 'home_cubit.dart';

enum HomeStatus {
  initial,
  loading,
  success,
  error,
}

extension HomeStatusX on HomeState {
  bool get isInitial => status == HomeStatus.initial;

  bool get isLoading => status == HomeStatus.loading;

  bool get isSuccess => status == HomeStatus.success;

  bool get isError => status == HomeStatus.error;
}

class HomeState extends Equatable {
  final HomeStatus status;
  final String error;
  final Profile? profile;
  final List<Park>? parks;

  const HomeState(
      {this.status = HomeStatus.initial,
      this.error = '',
      this.profile,
      this.parks});

  HomeState copyWith(
      {HomeStatus? status,
      String? error,
      Profile? profile,
      List<Park>? parks}) {
    return HomeState(
      status: status ?? this.status,
      error: error ?? this.error,
      profile: profile ?? this.profile,
      parks: parks ?? this.parks,
    );
  }

  @override
  List<Object?> get props => [status, error, profile, parks];
}
