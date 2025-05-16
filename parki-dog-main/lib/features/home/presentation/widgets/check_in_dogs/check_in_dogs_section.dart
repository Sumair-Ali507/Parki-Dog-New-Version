import 'package:parki_dog/features/home/export/home_export.dart';

class CheckInDogsSection extends StatelessWidget {
  final String currentLocation;
  final String leavingTime;
  final int dogCount;
  final VoidCallback? signalDogsOnTap;
  final VoidCallback? checkOutOnTap;
  final VoidCallback? extendTimeOnTap;

  const CheckInDogsSection({
    super.key,
    required this.currentLocation,
    required this.leavingTime,
    required this.dogCount,
    this.signalDogsOnTap,
    this.checkOutOnTap,
    this.extendTimeOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: ColorsManager.primary100,
          borderRadius: BorderRadius.circular(AppDouble.d16)),
      child: Column(
        children: [
          CurrentLocationLeavingTimeRow(
            currentLocation: currentLocation,
            leavingTime: leavingTime,
          ),
          const CurrentParkDivider(),
          CheckInDogsRow(
            dogCount: dogCount,
            signalDogsOnTap: signalDogsOnTap,
          ),
          const CurrentParkDivider(),
          CheckOutExtendRow(
              checkOutOnTap: checkOutOnTap, extendTimeOnTap: extendTimeOnTap)
        ],
      ),
    );
  }
}
