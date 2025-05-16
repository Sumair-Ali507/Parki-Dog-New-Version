import 'package:parki_dog/features/friends/export/friends_export.dart';

class BlockListScreen extends StatelessWidget {
  const BlockListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackAppBar(),
        title: const Text(LocaleKeys.friends_blocklist).plural(0,
            format: NumberFormat.compact(locale: context.locale.toString())),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const SvgIcon(
                  color: ColorsManager.grey700,
                  assetName: ImageAssets.moreOutlined))
        ],
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: AppDouble.d16),
        children: [
          ListView.separated(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) => FriendRow(
                    friendImage: ImageAssets.owner,
                    friendName: 'Tyra Dhillon',
                    dogImage: ImageAssets.dog1,
                    dogName: 'Poodle',
                    isMale: true,
                    moreOnTap: () {
                      showUnBlockBottomSheet(context, text: 'Tyra', onTap: () {
                        context.pop();
                        unblockingDialog(context,
                            isUnBlocked: false, isUnBlocking: true);
                      });
                    },
                  ),
              separatorBuilder: (context, index) => const Divider(
                    color: ColorsManager.grey100,
                    thickness: AppDouble.d1,
                    height: AppDouble.d32,
                  ),
              itemCount: 10)
        ],
      ),
    );
  }
}
