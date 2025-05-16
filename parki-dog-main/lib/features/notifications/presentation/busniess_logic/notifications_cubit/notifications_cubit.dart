import 'package:parki_dog/features/notifications/export/notifications_export.dart';

part 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  GetNotificationsUseCase getNotificationsUseCase;
  MarkNotificationsAsReadUseCase markNotificationsAsReadUseCase;

  NotificationsCubit(
      this.getNotificationsUseCase, this.markNotificationsAsReadUseCase)
      : super(const NotificationsState());

  getNotifications() async {
    emit(state.copyWith(status: NotificationsStatus.loading));
    final result = await getNotificationsUseCase(const NoParameters());
    if (result.$1 != null) {
      emit(state.copyWith(
        status: NotificationsStatus.error,
        error: result.$1!.message.tr(),
      ));
    } else {
      emit(state.copyWith(
        status: NotificationsStatus.success,
        notifications: result.$2?.notifications,
      ));
    }
  }

  markNotificationAsRead(String notificationId) async {
    List<AppNotification> newNotifications = state.notifications!
        .map((e) => e.sId == notificationId ? e.copyWith(isLoading: true) : e)
        .toList();
    emit(state.copyWith(notifications: newNotifications));
    final result = await markNotificationsAsReadUseCase(
        MarkNotificationsAsReadParameters(notificationId: notificationId));
    if (result.$1 != null) {
      newNotifications = state.notifications!
          .map(
              (e) => e.sId == notificationId ? e.copyWith(isLoading: false) : e)
          .toList();
      emit(state.copyWith(
        status: NotificationsStatus.error,
        error: result.$1!.message.tr(),
        notifications: newNotifications,
      ));
    } else {
      newNotifications = state.notifications!
          .map((e) => e.sId == notificationId
              ? e.copyWith(read: true, isLoading: false)
              : e)
          .toList();
      emit(state.copyWith(
        status: NotificationsStatus.success,
        notifications: newNotifications,
      ));
    }
  }
}
