import 'package:parki_dog/features/bottom_navigation_bar/export/bottom_navigation_export.dart';

class BottomNavigationBarScreen extends StatelessWidget {
  const BottomNavigationBarScreen({
    super.key,
  });

  List<Widget> bottomNavBarScreens(HomeState homeState) {
    return [
      HomeScreen(parks: homeState.parks ?? []),
      const MapScreen(),
      // const ActivitiesScreen(),
      // const ShopScreen(),
      MenuScreen(profile: homeState.profile),
    ];
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<BottomNavigationCubit, BottomNavigationState>(
      builder: (navContext, navState) {
        // var bottomNavigationCubit = BottomNavigationCubit.get(context);
        return SafeArea(
          child: BlocProvider(
            create: (context) => getIt<HomeCubit>()..homeInit(),
            child: BlocConsumer<HomeCubit, HomeState>(
              listener: (homeContext, homeState) {
                if (homeState.isError) {
                  showAppSnackBar(context, content: homeState.error);
                }
              },
              builder: (homeContext, homeState) {
                return Scaffold(
                  bottomNavigationBar: BottomNavigationBarWidget(
                    screenIndex: navState.index,
                  ),
                  body: homeState.isSuccess
                      ? bottomNavBarScreens(homeState)[navState.index]
                      : const Center(child: CircularProgressIndicator()),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
