import 'package:parki_dog/features/profile/export/profile_export.dart';

class OwnerDogToggle extends StatelessWidget {
  final OwnerDogCubit ownerDogCubit;

  const OwnerDogToggle({
    super.key,
    required this.ownerDogCubit,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OwnerDogCubit, OwnerDogEnum>(
      bloc: ownerDogCubit,
      builder: (ownerDogContext, ownerDogState) {
        return Container(
          padding: const EdgeInsets.all(AppDouble.d8),
          margin: const EdgeInsets.symmetric(horizontal: 46),
          decoration: BoxDecoration(
              color: ColorsManager.primary100,
              borderRadius: BorderRadius.circular(AppDouble.d16),
              border:
                  Border.all(color: ColorsManager.grey50, width: AppDouble.d1)),
          child: Row(
            children: [
              Expanded(
                  child: ElevatedButton(
                      style: ownerDogState == OwnerDogEnum.owner
                          ? null
                          : ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.primary100,
                              shadowColor: Colors.transparent,
                            ),
                      onPressed: () {
                        ownerDogCubit.selectOwner();
                      },
                      child: Text(
                        LocaleKeys.profile_owner,
                        style: ownerDogState == OwnerDogEnum.owner
                            ? null
                            : TextStyles.font14Grey400SemiBold(),
                      ).tr())),
              const SizedBox(width: AppDouble.d8),
              Expanded(
                  child: ElevatedButton(
                      style: ownerDogState == OwnerDogEnum.dog
                          ? null
                          : ElevatedButton.styleFrom(
                              backgroundColor: ColorsManager.primary100,
                              shadowColor: Colors.transparent,
                            ),
                      onPressed: () {
                        ownerDogCubit.selectDog();
                      },
                      child: Text(
                        LocaleKeys.profile_dog,
                        style: ownerDogState == OwnerDogEnum.dog
                            ? null
                            : TextStyles.font14Grey400SemiBold(),
                      ).tr()))
            ],
          ),
        );
      },
    );
  }
}
