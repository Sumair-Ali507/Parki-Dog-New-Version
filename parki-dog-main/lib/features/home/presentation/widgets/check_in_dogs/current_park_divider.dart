import 'package:parki_dog/features/home/export/home_export.dart';

class CurrentParkDivider extends StatelessWidget {
  const CurrentParkDivider({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const Divider(
      thickness: AppDouble.d1,
      color: ColorsManager.greyDividerHome,
      height: AppDouble.d32,
    );
  }
}
