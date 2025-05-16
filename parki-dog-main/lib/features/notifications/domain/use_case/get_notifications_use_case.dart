import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/notifications/data/models/notifications_response.dart';
import 'package:parki_dog/features/notifications/domain/repository/base_notifications_repository.dart';

class GetNotificationsUseCase
    extends BaseUseCase<NotificationsResponse, NoParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  GetNotificationsUseCase(this.baseNotificationsRepository);

  @override
  Future<(Failure?, NotificationsResponse?)> call(NoParameters parameters) {
    return baseNotificationsRepository.getNotifications(parameters);
  }
}
