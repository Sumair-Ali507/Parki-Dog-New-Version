import 'package:dio/dio.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/error/error_handler.dart';
import 'package:parki_dog/core/error/failure.dart';
import 'package:parki_dog/features/notifications/data/datasource/romote/notifications_remote_data_source.dart';
import 'package:parki_dog/features/notifications/data/models/notifications_response.dart';
import 'package:parki_dog/features/notifications/domain/repository/base_notifications_repository.dart';
import 'package:parki_dog/features/notifications/domain/use_case/mark_notifications_as_read.dart';

class NotificationsRepository extends BaseNotificationsRepository {
  final BaseNotificationsRemoteDataSource baseNotificationsRemoteDataSource;

  NotificationsRepository(this.baseNotificationsRemoteDataSource);

  @override
  Future<(Failure?, NotificationsResponse?)> getNotifications(
      NoParameters parameters) async {
    try {
      final result =
          await baseNotificationsRemoteDataSource.getNotifications(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }

  @override
  Future<(Failure?, bool?)> markNotificationsAsRead(
      MarkNotificationsAsReadParameters parameters) async {
    try {
      final result = await baseNotificationsRemoteDataSource
          .markNotificationsAsRead(parameters);
      return (null, result);
    } on DioException catch (error) {
      return (ErrorHandler.handle(error).failure, null);
    }
  }
}
