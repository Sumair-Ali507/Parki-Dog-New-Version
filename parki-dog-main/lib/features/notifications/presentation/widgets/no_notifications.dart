import 'package:parki_dog/features/notifications/export/notifications_export.dart';

class NoNotifications extends StatelessWidget {
  const NoNotifications({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const NoContentWidget(
        text: LocaleKeys.notifications_youAreAllCaughtUp,
        assetName: ImageAssets.noSessions);
  }
}
