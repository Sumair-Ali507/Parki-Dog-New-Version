part of 'notifications_cubit.dart';

enum NotificationsStatus {
  initial,
  loading,
  success,
  error,
}

extension NotificationsStatusX on NotificationsState {
  bool get isInitial => status == NotificationsStatus.initial;

  bool get isLoading => status == NotificationsStatus.loading;

  bool get isSuccess => status == NotificationsStatus.success;

  bool get isError => status == NotificationsStatus.error;
}

class NotificationsState extends Equatable {
  final NotificationsStatus status;
  final String error;
  final List<AppNotification>? notifications;

  const NotificationsState({
    this.status = NotificationsStatus.initial,
    this.error = '',
    this.notifications,
  });

  NotificationsState copyWith({
    NotificationsStatus? status,
    String? error,
    List<AppNotification>? notifications,
  }) {
    return NotificationsState(
      status: status ?? this.status,
      error: error ?? this.error,
      notifications: notifications ?? this.notifications,
    );
  }

  @override
  List<Object?> get props => [status, error, notifications];
}
