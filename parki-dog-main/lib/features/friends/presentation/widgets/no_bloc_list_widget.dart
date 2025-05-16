import 'package:parki_dog/features/friends/export/friends_export.dart';

class NoBlocListWidget extends StatelessWidget {
  const NoBlocListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoContentWidget(
        text: LocaleKeys.friends_noBlocklist, assetName: ImageAssets.noBlocked);
  }
}
