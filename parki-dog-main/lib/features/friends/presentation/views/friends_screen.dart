import 'package:parki_dog/features/friends/export/friends_export.dart';

class FriendsScreen extends StatelessWidget {
  const FriendsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt<FriendsCubit>()..getFriends(),
      child: BlocConsumer<FriendsCubit, FriendsState>(
        listener: (friendsContext, friendsState) {
          if (friendsState.isError) {
            showAppSnackBar(context, content: friendsState.error);
          }
        },
        builder: (friendsContext, friendsState) {
          return Scaffold(
            appBar: AppBar(
              leading: const BackAppBar(),
              title: const Text(LocaleKeys.friends_friends).plural(
                  friendsState.isSuccess
                      ? friendsState.friends?.friends?.length ?? 0
                      : 0,
                  format:
                      NumberFormat.compact(locale: context.locale.toString())),
              actions: [
                IconButton(
                    onPressed: () {
                      showBlocklistBottomSheet(context);
                    },
                    icon: const SvgIcon(
                        color: ColorsManager.grey700,
                        assetName: ImageAssets.moreOutlined))
              ],
            ),
            body: friendsState.isSuccess
                ? (friendsState.friends?.friends?.length != null &&
                        friendsState.friends!.friends!.isNotEmpty)
                    ? ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding:
                            const EdgeInsets.symmetric(vertical: AppDouble.d16),
                        itemBuilder: (context, index) => FriendRow(
                              friendImage: ImageAssets.owner,
                              friendName:
                                  '${friendsState.friends?.friends?[index].friend?.firstName ?? ''} ${friendsState.friends?.friends?[index].friend?.lastName ?? ''}',
                              dogImage: ImageAssets.dog1,
                              dogName: 'Poodle',
                              isMale: true,
                              moreOnTap: () {
                                showFriendOptionsBottomSheet(context,
                                    text: friendsState.friends?.friends?[index]
                                            .friend?.firstName ??
                                        '', blockOnTap: () {
                                  context.pop();
                                  blockingDialog(context,
                                      name: 'Tyra',
                                      isBlocked: false,
                                      isBlocking: false,
                                      mainActionOnTap: () {});
                                }, deleteOnTap: () {
                                  context.pop();
                                  friendDeletingDialog(
                                    friendsContext,
                                    name: friendsState.friends?.friends?[index]
                                            .friend?.firstName ??
                                        '',
                                    friendsCubit:
                                        friendsContext.read<FriendsCubit>(),
                                    userId: friendsState
                                        .friends!.friends![index].friend!.id!,
                                  );
                                });
                              },
                            ),
                        separatorBuilder: (context, index) => const Divider(
                              color: ColorsManager.grey100,
                              thickness: AppDouble.d1,
                              height: AppDouble.d32,
                            ),
                        itemCount: friendsState.friends?.friends?.length ?? 0)
                    : const NoFriendsWidget()
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          );
        },
      ),
    );
  }
}
