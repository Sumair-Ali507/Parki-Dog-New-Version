import 'package:parki_dog/features/home/export/home_export.dart';

class DogsStack extends StatelessWidget {
  const DogsStack({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      width: AppDouble.d40,
      height: AppDouble.d16, // Height of each circle including border
      child: Stack(
        alignment: Alignment.center,
        children: [
          PositionedDirectional(
              start: AppDouble.d0,
              child: DogCircleAvatar(assetName: ImageAssets.dog1)),
          PositionedDirectional(
              start: AppDouble.d11, // Positioned for overlap
              child: DogCircleAvatar(assetName: ImageAssets.dog2)),
          PositionedDirectional(
              end: AppDouble.d0,
              child: DogCircleAvatar(assetName: ImageAssets.dog3)),
        ],
      ),
    );
  }
}
