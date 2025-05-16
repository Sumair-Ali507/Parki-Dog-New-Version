import 'package:parki_dog/features/profile/export/profile_export.dart';

class DogColumn extends StatelessWidget {
  final Profile? profile;
  const DogColumn({
    super.key,
    required this.profile,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        DogImage(
          imageAsset: ImageAssets.dog1,
          onTap: () {},
          dogName: profile?.ownedDogs?.first.name ?? '',
          breed: profile?.ownedDogs?.first.breed ?? '',
          isMale: profile?.ownedDogs?.first.gender?.toLowerCase() == 'male',
        ),
        const SizedBox(height: AppDouble.d24),
        ProfileContainer(
            title: LocaleKeys.profile_dogInfo,
            isEdit: true,
            onTap: () {
              context.pushNamed(Routes.updateDogRoute,arguments: profile);
            },
            child: Column(
              children: [
                ProfileContainerRow(
                    text: LocaleKeys.profile_name,
                    iconAsset: ImageAssets.name,
                    value: profile?.ownedDogs?.first.name ?? ''),
                ProfileContainerRow(
                    text: LocaleKeys.profile_breed,
                    iconAsset: ImageAssets.petOutlined,
                    value: profile?.ownedDogs?.first.breed ?? ''),
                ProfileContainerRow(
                    text: LocaleKeys.profile_gender,
                    iconAsset: ImageAssets.man,
                    value: profile?.ownedDogs?.first.gender ?? 'male'),
                ProfileContainerRow(
                    text: LocaleKeys.profile_age,
                    iconAsset: ImageAssets.calendarHeart,
                    value: '${profile?.ownedDogs?.first.age ?? ''}'),
                ProfileContainerRow(
                  text: LocaleKeys.profile_weight,
                  iconAsset: ImageAssets.weight,
                  value: '${profile?.ownedDogs?.first.weight ?? ''}',
                  isEnd: true,
                ),
                // ProfileContainerRow(
                //    text: LocaleKeys.profile_chipNumber,
                //    iconAsset: ImageAssets.chip,
                //    value: '${profile?.ownedDogs?.first.chip??''}',
                //    isEnd: true),
              ],
            )),
        // const SizedBox(height: AppDouble.d24),
        // ProfileContainer(
        //     title: LocaleKeys.profile_trainings,
        //     isEdit: false,
        //     onTap: () {},
        //     child: const Column(
        //       children: [],
        //     )),
        // const SizedBox(height: AppDouble.d24),
        // ProfileContainer(
        //     title: LocaleKeys.profile_vaccination,
        //     isEdit: false,
        //     onTap: () {},
        //     child: const Column(
        //       children: [],
        //     )),
        const SizedBox(height: AppDouble.d24),
        ProfileContainer(
            title: LocaleKeys.profile_unsociableWith,
            isEdit: true,
            onTap: () {},
            child: Column(
              children: [
                ProfileContainerRow(
                    text: LocaleKeys.profile_breeds,
                    iconAsset: ImageAssets.petOutlined,
                    value:
                        '${profile?.ownedDogs?.first.unsociability?.breeds?.length ?? '0'} breeds'),
                ProfileContainerRow(
                    text: LocaleKeys.profile_gender,
                    iconAsset: ImageAssets.man,
                    value:
                        '${profile?.ownedDogs?.first.unsociability?.genders?.length ?? '0'}'),
                ProfileContainerRow(
                    text: LocaleKeys.profile_weight,
                    iconAsset: ImageAssets.weight,
                    value:
                        '>${profile?.ownedDogs?.first.unsociability?.minWeight ?? ''}',
                    isEnd: true),
              ],
            )),
      ],
    );
  }
}
