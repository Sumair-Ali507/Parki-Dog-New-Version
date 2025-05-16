import 'package:parki_dog/features/map/export/map_export.dart';

class CheckInDivider extends StatelessWidget {
  final double height;

  const CheckInDivider({
    super.key,
    this.height = AppDouble.d32,
  });

  @override
  Widget build(BuildContext context) {
    return Divider(
        thickness: AppDouble.d1, color: ColorsManager.grey100, height: height);
  }
}
