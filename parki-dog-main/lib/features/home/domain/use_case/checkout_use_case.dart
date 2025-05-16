import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/home/domain/repository/base_home_repository.dart';

class CheckoutUseCase extends BaseUseCase<bool, NoParameters> {
  final BaseHomeRepository baseHomeRepository;

  CheckoutUseCase(this.baseHomeRepository);

  @override
  Future<(Failure?, bool?)> call(NoParameters parameters) {
    return baseHomeRepository.checkOut(parameters);
  }
}
