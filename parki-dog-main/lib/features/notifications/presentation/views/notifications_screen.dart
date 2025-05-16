import 'package:parki_dog/features/notifications/export/notifications_export.dart';

class NotificationsScreen extends StatelessWidget {
  const NotificationsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // bool isAllRead = true;
    return BlocProvider(
      create: (context) => getIt<NotificationsCubit>()..getNotifications(),
      child: Scaffold(
        appBar: AppBar(
          leading: const BackButton(),
          title: const Text(LocaleKeys.notifications_notifications).tr(),
          actions: [
            TextButton(
                onPressed: () {},
                child: Text(
                  LocaleKeys.notifications_allRead,
                  style: TextStyles.font12PrimaryRegular(
                      color:
                          // isAllRead
                          //     ?
                          ColorsManager.grey300
                      // : ColorsManager.primaryColor,
                      ),
                ).tr())
          ],
        ),
        body: BlocConsumer<NotificationsCubit, NotificationsState>(
          listener: (notificationContext, notificationState) {
            if (notificationState.isError) {
              showAppSnackBar(context, content: notificationState.error);
            }
          },
          builder: (notificationContext, notificationState) {
            return notificationState.isSuccess
                ? notificationState.notifications!.isNotEmpty
                    ? ListView.separated(
                        separatorBuilder: (context, index) => const Divider(
                          color: ColorsManager.grey100,
                          thickness: 1,
                          height: 0,
                        ),
                        itemCount: notificationState.notifications?.length ?? 0,
                        itemBuilder: (context, index) => NotificationItem(
                          isRead:
                              notificationState.notifications?[index].read ??
                                  false,
                          isItemLoading: notificationState
                                  .notifications?[index].isLoading ??
                              false,
                          notificationText:
                              '${notificationState.notifications?[index].sender?.firstName ?? ''} ${notificationState.notifications?[index].sender?.lastName ?? ''} ${notificationState.notifications?[index].type?.replaceAll('_', ' ') ?? ''}',
                          time: notificationState
                                  .notifications?[index].createdAt ??
                              '',
                          onTap: () async {
                            await notificationContext
                                .read<NotificationsCubit>()
                                .markNotificationAsRead(notificationState
                                        .notifications?[index].sId ??
                                    '');
                          },
                          dogImage: ImageAssets.owner,
                          personImage: ImageAssets.dog1,
                        ),
                      )
                    : const NoNotifications()
                : const Center(child: CircularProgressIndicator());
          },
        ),
      ),
    );
  }
}
