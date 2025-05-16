import 'package:parki_dog/features/home/export/home_export.dart';

class HomeScreen extends StatelessWidget {
  final List<Park> parks;

  const HomeScreen({super.key, required this.parks});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: ListView(
          padding: const EdgeInsets.symmetric(
              vertical: AppDouble.d24, horizontal: AppDouble.d16),
          children: [
            HomeAppBar(
              chatOnTap: () {
                context.pushNamed(Routes.chatRoute);
              },
              notificationOnTap: () {
                context.pushNamed(Routes.notificationsRoute);
              },
              isRedCircleChat: true,
              isRedCircleNotification: true,
            ),
            const SizedBox(height: AppDouble.d32),
            Text(LocaleKeys.home_getToKnowUs,
                    style: TextStyles.font18AppBlackSemiBold())
                .tr(),
            const SizedBox(height: AppDouble.d12),
            HowWorksMissionRow(howWorks: () {
              context.pushNamed(Routes.howWorksRoute);
            }, missionOnTap: () {
              context.pushNamed(Routes.ourMissionScreenRoute);
            }),
            const SizedBox(height: AppDouble.d32),
            CheckInDogsSection(
                leavingTime: '03:30 pm',
                currentLocation: 'Nafee Park',
                dogCount: 14,
                signalDogsOnTap: () {
                  signalDogsBottomSheet(context,
                      onSignalDogsSelected: (model) {});
                },
                checkOutOnTap: () {
                  dogCheckOutPopup(context, confirmOnTap: () {});
                },
                extendTimeOnTap: () {
                  selectDateTimePopup(context,
                      title: LocaleKeys.dateAndTimePicker_selectTime,
                      onDateTimeChanged: (time) {},
                      isDatePickerMode: false);
                }),
            NearPlacesColumn(parks: parks),
            const ComingSoon(),
            const TellFeedBack(),
          ],
        ),
      ),
    );
  }
}
