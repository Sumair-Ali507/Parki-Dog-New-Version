import 'package:parki_dog/features/home/export/home_export.dart';

class DogCircleAvatar extends StatelessWidget {
  final String assetName;
  const DogCircleAvatar({
    super.key,
    required this.assetName,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        border: Border.all(color: ColorsManager.white, width: AppDouble.d1),
      ),
      child: CircleAvatar(
        radius: AppDouble.d8,
        backgroundImage: AssetImage(assetName),
      ),
    );
  }
}
