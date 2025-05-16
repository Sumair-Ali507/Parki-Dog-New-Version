import 'package:parki_dog/features/chat/export/chat_export.dart';

class EmptyInbox extends StatelessWidget {
  const EmptyInbox({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 1.sw / 2),
      child: const NoContentWidget(
          text: LocaleKeys.chat_emptyInbox, assetName: ImageAssets.noChats),
    );
  }
}
