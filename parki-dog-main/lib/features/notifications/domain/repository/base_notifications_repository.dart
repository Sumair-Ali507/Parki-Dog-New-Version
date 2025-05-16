import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/notifications/data/models/notifications_response.dart';
import 'package:parki_dog/features/notifications/domain/use_case/mark_notifications_as_read.dart';

abstract class BaseNotificationsRepository {
  Future<(Failure?, NotificationsResponse?)> getNotifications(
      NoParameters parameters);
  Future<(Failure?, bool?)> markNotificationsAsRead(
      MarkNotificationsAsReadParameters parameters);
}
