import 'package:parki_dog/features/friends/export/friends_export.dart';

class OverlappingImagesOwnerDogsWidget extends StatelessWidget {
  final String dogImage;
  final String friendImage;

  const OverlappingImagesOwnerDogsWidget(
      {super.key,
      required this.dogImage,
      required this.friendImage}); // Smaller image URL

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: AppDouble.d50,
      width: AppDouble.d70,
      child: Stack(
        children: [
          PositionedDirectional(
            start: AppDouble.d0,
            child: CircleAvatar(
              radius: AppDouble.d24, // Size of the larger image
              backgroundImage: AssetImage(friendImage),
            ),
          ),
          PositionedDirectional(
            start: AppDouble.d28, // Adjust this for the overlapping effect
            child: CircleAvatar(
              radius: AppDouble.d22, // Size of the smaller image
              backgroundColor: Colors.white, // White border
              child: CircleAvatar(
                radius: AppDouble.d20, // Inner image size
                backgroundImage: AssetImage(dogImage),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
