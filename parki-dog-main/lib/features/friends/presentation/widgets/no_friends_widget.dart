import 'package:parki_dog/features/friends/export/friends_export.dart';

class NoFriendsWidget extends StatelessWidget {
  const NoFriendsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const NoContentWidget(
        text: LocaleKeys.friends_noFriends, assetName: ImageAssets.noFriends);
  }
}
