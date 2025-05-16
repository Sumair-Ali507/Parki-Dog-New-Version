import 'package:parki_dog/features/chat/export/chat_export.dart';

class NoMessages extends StatelessWidget {
  const NoMessages({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const NoContentWidget(
        text: LocaleKeys.chat_noMessages, assetName: ImageAssets.noMessages);
  }
}
