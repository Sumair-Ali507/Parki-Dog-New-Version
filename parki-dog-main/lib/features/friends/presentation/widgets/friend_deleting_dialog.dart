import 'package:parki_dog/features/friends/export/friends_export.dart';

Future<dynamic> friendDeletingDialog(
  BuildContext context, {
  required String name,
  required FriendsCubit friendsCubit,
  required String userId,
}) {
  return showAppDialog(context,
      title: DeleteDialogTitle(
        friendsCubit: friendsCubit,
      ),
      content: SizedBox(
          width: AppDouble.d1.sw,
          child: BlocBuilder<FriendsCubit, FriendsState>(
            bloc: friendsCubit,
            builder: (friendsContext, friendsState) {
              return (friendsState.isUnFriendLoading ||
                      friendsState.isUnFriendSuccess)
                  ? DialogStatus(
                      isDone: friendsState.isUnFriendSuccess,
                      text: LocaleKeys.friends_deleted,
                    )
                  : Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          LocaleKeys.friends_deleteSomeone.tr(args: [name]),
                          textAlign: TextAlign.start,
                          style: TextStyles.font18NavyBlueDarkMedium(),
                        ),
                        const SizedBox(height: AppDouble.d4),
                        Text(
                          LocaleKeys.friends_wantToDelete.tr(args: [name]),
                          textAlign: TextAlign.start,
                          style: TextStyles.font14Grey400Regular(),
                        ),
                        const SizedBox(height: AppDouble.d16),
                        SizedBox(
                          width: AppDouble.d1.sw,
                          child: ElevatedButton(
                              onPressed: () {
                                friendsCubit.deleteFriend(userId);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: ColorsManager.red600,
                                textStyle: TextStyles.font16WhiteMedium(),
                              ),
                              child:
                                  const Text(LocaleKeys.friends_delete).tr()),
                        ),
                        const SizedBox(height: AppDouble.d12),
                        SizedBox(
                          width: AppDouble.d1.sw,
                          child: OutlinedButton(
                            onPressed: () {
                              context.pop();
                            },
                            child: Text(
                              LocaleKeys.friends_cancel,
                              style: TextStyles.font16Grey600Medium(),
                            ).tr(),
                          ),
                        ),
                      ],
                    );
            },
          )));
}

class DeleteDialogTitle extends StatelessWidget {
  final FriendsCubit friendsCubit;

  const DeleteDialogTitle({super.key, required this.friendsCubit});

  @override
  Widget build(BuildContext context) {
    return BlocSelector<FriendsCubit, FriendsState, bool>(
      bloc: friendsCubit,
      selector: (state) => state.isUnFriendLoading || state.isUnFriendSuccess,
      builder: (friendsContext, isUnFriendActive) {
        return isUnFriendActive
            ? const SizedBox()
            : Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: ColorsManager.borderLightRed,
                        width: AppDouble.d8,
                      ),
                    ),
                    child: const CircleAvatar(
                      backgroundColor: ColorsManager.red100,
                      child: SvgIcon(
                        color: ColorsManager.redIcon,
                        assetName: ImageAssets.cancel,
                      ),
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      context.pop();
                    },
                    icon: const AppIcon(
                      assetName: ImageAssets.close,
                      color: ColorsManager.iconDefault,
                    ),
                  ),
                ],
              );
      },
    );
  }
}
