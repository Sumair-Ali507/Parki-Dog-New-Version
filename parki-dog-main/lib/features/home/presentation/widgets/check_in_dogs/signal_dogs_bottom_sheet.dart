import 'package:parki_dog/features/home/export/home_export.dart';

Future<dynamic> signalDogsBottomSheet(BuildContext context,
    {required Function(SignalDogsModel) onSignalDogsSelected}) {
  return buildAppBottomSheet(context,
      heightFactor: AppDouble.d0_6,
      radius: AppDouble.d16,
      content: BlocProvider(
        create: (context) => SignalDogsCubit(),
        child: BlocBuilder<SignalDogsCubit, SignalDogsModel>(
          builder: (signalDogsContext, signalDogsState) {
            SignalDogsCubit signalDogsCubit =
                signalDogsContext.read<SignalDogsCubit>();
            return ListView(
              padding: const EdgeInsets.all(AppDouble.d16),
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Padding(
                      padding: EdgeInsets.only(top: AppDouble.d6),
                      child: SvgIcon(
                          color: ColorsManager.redIcon,
                          assetName: ImageAssets.disclaimer),
                    ),
                    const SizedBox(width: AppDouble.d8),
                    Flexible(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(LocaleKeys.home_signalDogs,
                                  style: TextStyles.font20Red600Medium())
                              .tr(),
                          const SizedBox(height: AppDouble.d4),
                          Text(LocaleKeys.home_signalDogsDialogSubHeader,
                                  style: TextStyles.font14Grey500Regular())
                              .tr(),
                        ],
                      ),
                    ),
                    const SizedBox(width: AppDouble.d8),
                    IconButton(
                        onPressed: () {
                          context.pop();
                        },
                        icon: const SvgIcon(
                            color: ColorsManager.iconDefault,
                            assetName: ImageAssets.close)),
                  ],
                ),
                const Divider(
                    color: ColorsManager.grey200, height: AppDouble.d32),
                const SizedBox(width: AppDouble.d28),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(LocaleKeys.home_howManyMaleDogs,
                                style: TextStyles.font16Grey600Medium())
                            .tr()),
                    const SizedBox(width: AppDouble.d4),
                    CounterRow(
                        increaseOnTap: () {
                          signalDogsCubit.incrementMaleDogs();
                        },
                        value: signalDogsState.maleDogs,
                        decreaseOnTap: () {
                          signalDogsCubit.decrementMaleDogs();
                        }),
                  ],
                ),
                const Divider(
                    color: ColorsManager.grey200, height: AppDouble.d32),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Flexible(
                        child: Text(LocaleKeys.home_howManyFemaleDogs,
                                style: TextStyles.font16Grey600Medium())
                            .tr()),
                    const SizedBox(width: AppDouble.d4),
                    CounterRow(
                        increaseOnTap: () {
                          signalDogsCubit.incrementFemaleDogs();
                        },
                        value: signalDogsState.femaleDogs,
                        decreaseOnTap: () {
                          signalDogsCubit.decrementFemaleDogs();
                        }),
                  ],
                ),
                const SizedBox(width: AppDouble.d28),
                const Divider(
                    color: ColorsManager.grey200, height: AppDouble.d32),
                ElevatedButton(
                    onPressed: () {
                      onSignalDogsSelected(signalDogsState);
                      context.pop();
                    },
                    child: const Text(LocaleKeys.home_confirm).tr())
              ],
            );
          },
        ),
      ));
}

class CounterRow extends StatelessWidget {
  final VoidCallback increaseOnTap;
  final VoidCallback decreaseOnTap;
  final int value;

  const CounterRow({
    super.key,
    required this.increaseOnTap,
    required this.decreaseOnTap,
    required this.value,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        CounterButton(assetName: ImageAssets.minus, onTap: decreaseOnTap),
        const SizedBox(width: AppDouble.d8),
        Container(
          padding: const EdgeInsets.symmetric(
              vertical: AppDouble.d6, horizontal: AppDouble.d16),
          decoration: const ShapeDecoration(
              shape: StadiumBorder(
            side: BorderSide(color: ColorsManager.grey100, width: AppDouble.d1),
          )),
          child: Text(
            '$value',
            style: TextStyles.font14Grey600Medium(),
          ),
        ),
        const SizedBox(width: AppDouble.d8),
        CounterButton(assetName: ImageAssets.add, onTap: increaseOnTap)
      ],
    );
  }
}

class CounterButton extends StatelessWidget {
  final String assetName;
  final VoidCallback onTap;

  const CounterButton({
    super.key,
    required this.assetName,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(AppDouble.d16),
      child: CircleAvatar(
          backgroundColor: ColorsManager.grey100,
          radius: AppDouble.d16,
          child: SvgIcon(color: ColorsManager.grey600, assetName: assetName)),
    );
  }
}
