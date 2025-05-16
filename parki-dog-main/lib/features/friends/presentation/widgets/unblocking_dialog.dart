import 'package:parki_dog/features/friends/export/friends_export.dart';

Future<dynamic> unblockingDialog(
  BuildContext context, {
  bool isUnBlocking = false,
  bool isUnBlocked = false,
}) {
  return showAppDialog(context,
      content: SizedBox(
        width: AppDouble.d1.sw,
        child: DialogStatus(
          isDone: isUnBlocked,
          text: isUnBlocking
              ? LocaleKeys.friends_unblocking
              : LocaleKeys.friends_unblocked,
        ),
      ));
}
