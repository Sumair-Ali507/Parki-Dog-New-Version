import 'package:equatable/equatable.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/notifications/domain/repository/base_notifications_repository.dart';

class MarkNotificationsAsReadUseCase
    extends BaseUseCase<bool, MarkNotificationsAsReadParameters> {
  final BaseNotificationsRepository baseNotificationsRepository;

  MarkNotificationsAsReadUseCase(this.baseNotificationsRepository);

  @override
  Future<(Failure?, bool?)> call(MarkNotificationsAsReadParameters parameters) {
    return baseNotificationsRepository.markNotificationsAsRead(parameters);
  }
}

class MarkNotificationsAsReadParameters extends Equatable {
  final String notificationId;
  const MarkNotificationsAsReadParameters({required this.notificationId});

  @override
  List<Object?> get props => [notificationId];
}
