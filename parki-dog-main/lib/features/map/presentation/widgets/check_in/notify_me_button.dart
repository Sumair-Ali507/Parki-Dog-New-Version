import 'package:parki_dog/features/map/export/map_export.dart';

class NotifyMeButton extends StatelessWidget {
  const NotifyMeButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NotifyMeCubit(),
      child: BlocBuilder<NotifyMeCubit, NotifyMeState>(
        builder: (notifyMeContext, notifyMeState) {
          return TextButton.icon(
            onPressed: () {
              notifyMeContext.read<NotifyMeCubit>().toggle();
            },
            icon: SvgIcon(
                color: notifyMeState.isToggled
                    ? ColorsManager.green
                    : ColorsManager.grey400,
                assetName: notifyMeState.isToggled
                    ? ImageAssets.check
                    : ImageAssets.notifyMe),
            label: Text(
              LocaleKeys.checkIn_notifyMe,
              style: TextStyles.font12Grey600SemiBoldUnderline(
                  color: notifyMeState.isToggled
                      ? ColorsManager.green
                      : ColorsManager.grey600,
                  decoration: notifyMeState.isToggled
                      ? TextDecoration.none
                      : TextDecoration.underline),
            ).tr(),
          );
        },
      ),
    );
  }
}
