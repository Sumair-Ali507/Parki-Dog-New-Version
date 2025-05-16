import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/dog_owner/data/models/near_by_parks.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';

class NearByParksUseCase
    extends BaseUseCase<NearByParksResponse, NearByParksParameters> {
  final BaseHomeRepository baseHomeRepository;

  NearByParksUseCase(this.baseHomeRepository);

  @override
  Future<(Failure?, NearByParksResponse?)> call(
      NearByParksParameters parameters) {
    return baseHomeRepository.nearByParks(parameters);
  }
}

class NearByParksParameters extends Equatable {
  final String lat;
  final String long;
  final double? radius;
  final String? type;

  const NearByParksParameters(
      {required this.lat,
      required this.long,
      this.radius = 20000,
      this.type = 'park'});

  @override
  List<Object?> get props => [lat, long, radius, type];
}
