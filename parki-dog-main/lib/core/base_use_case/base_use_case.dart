import 'package:parki_dog/core/error/failure.dart';
import 'package:equatable/equatable.dart';

abstract class BaseUseCase<T, Parameters> {
  Future<(Failure?, T?)> call(Parameters parameters);
}

class NoParameters extends Equatable {
  const NoParameters();

  @override
  List<Object> get props => [];
}
