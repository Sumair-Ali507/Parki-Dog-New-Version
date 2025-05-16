import 'package:parki_dog/features/profile/export/profile_export.dart';

class ProfileScreen extends StatelessWidget {
  final Profile? profile;
  const ProfileScreen({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const BackAppBar(),
        title: const Text(LocaleKeys.profile_profile).tr(),
        actions: [
          IconButton(
              onPressed: () {},
              icon: const SvgIcon(
                  color: ColorsManager.grey700,
                  assetName: ImageAssets.moreOutlined))
        ],
      ),
      body: BlocProvider(
        create: (context) => OwnerDogCubit(),
        child: BlocBuilder<OwnerDogCubit, OwnerDogEnum>(
          builder: (ownerDogContext, ownerDogState) {
            OwnerDogCubit ownerDogCubit = ownerDogContext.read<OwnerDogCubit>();
            return ListView(
              padding: const EdgeInsets.all(AppDouble.d16),
              children: [
                OwnerDogToggle(ownerDogCubit: ownerDogCubit),
                const SizedBox(height: AppDouble.d24),
                if (ownerDogState == OwnerDogEnum.owner)
                  OwnerColumn(profile: profile),
                if (ownerDogState == OwnerDogEnum.dog)
                  DogColumn(
                    profile: profile,
                  ),
              ],
            );
          },
        ),
      ),
    );
  }
}
