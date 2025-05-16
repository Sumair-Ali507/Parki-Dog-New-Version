import 'package:parki_dog/features/menu/export/menu_export.dart';

class MenuScreen extends StatelessWidget {
  final Profile? profile;
  const MenuScreen({super.key, this.profile});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Padding(
          padding: const EdgeInsets.all(AppDouble.d16),
          child: Text(
            LocaleKeys.menu_menu.tr(),
            style: TextStyles.font24Grey700SemiBold(),
          ),
        ),
        leadingWidth: AppDouble.d120,
        toolbarHeight: 70,
      ),
      body: ListView(
        padding: const EdgeInsets.all(AppDouble.d15),
        children: [
          MenuProfileContainer(
            name: '${profile?.firstName ?? ''} ${profile?.lastName ?? ''}',
            dogName: profile?.ownedDogs?.first.name ?? '',
            isMale:
                (profile?.ownedDogs?.first.gender ?? 'male').toLowerCase() ==
                    'male',
            dogImage: ImageAssets.dog1,
            ownerImage: ImageAssets.owner,
            onTap: () {
              context.pushNamed(Routes.profileRoute, arguments: profile);
            },
          ),
          const SizedBox(height: 24),
          MenuItem(
            assetName: ImageAssets.friends,
            title: LocaleKeys.menu_friends,
            onTap: () {
              context.pushNamed(Routes.friendsRoute);
            },
          ),
          // MenuItem(assetName: ImageAssets.myOrders,title: LocaleKeys.menu_myOrders,onTap: (){},),
          MenuItem(
            assetName: ImageAssets.signInAndSecurity,
            title: LocaleKeys.menu_singInAndSecurity,
            onTap: () {
              context.pushNamed(Routes.signInAndSecurityRoute);
            },
          ),
          MenuItem(
            assetName: ImageAssets.termsAndConditions,
            title: LocaleKeys.menu_termsAndConditions,
            onTap: () {
              context.pushNamed(Routes.termsAndConditionsRoute);
            },
          ),
          MenuItem(
            assetName: ImageAssets.globe,
            title: LocaleKeys.menu_appLanguage,
            onTap: () {
              context.pushNamed(Routes.selectLanguageRoute);
            },
          ),
        ],
      ),
    );
  }
}
