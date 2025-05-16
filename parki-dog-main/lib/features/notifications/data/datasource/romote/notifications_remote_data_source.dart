import 'package:parki_dog/core/base_data_source/remote/base_app_remote_data_source.dart';
import 'package:parki_dog/core/base_use_case/base_use_case.dart';
import 'package:parki_dog/core/network/make_api_call.dart';
import 'package:parki_dog/core/network/network_constants.dart';
import 'package:parki_dog/features/notifications/data/models/notifications_response.dart';
import 'package:parki_dog/features/notifications/domain/use_case/mark_notifications_as_read.dart';

abstract class BaseNotificationsRemoteDataSource
    extends BaseAppRemoteDataSource {
  Future<NotificationsResponse> getNotifications(NoParameters parameters);
  Future<bool> markNotificationsAsRead(
      MarkNotificationsAsReadParameters parameters);
}

class NotificationsRemoteDataSource extends BaseNotificationsRemoteDataSource {
  @override
  Future<NotificationsResponse> getNotifications(
      NoParameters parameters) async {
    return await makeApiCall(
        url: NetworkConstants.notifications,
        method: HttpMethod.get,
        fromJson: (data) => NotificationsResponse.fromJson(data));
  }

  @override
  Future<bool> markNotificationsAsRead(
      MarkNotificationsAsReadParameters parameters) async {
    return await makeApiCall(
        url:
            '${NetworkConstants.notifications}/${parameters.notificationId}/read',
        method: HttpMethod.patch,
        fromJson: (data) => true);
  }
}
