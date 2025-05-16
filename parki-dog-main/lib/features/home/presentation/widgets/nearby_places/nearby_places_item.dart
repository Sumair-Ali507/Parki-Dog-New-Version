import 'package:parki_dog/features/home/export/home_export.dart';

class NearbyPlacesItem extends StatelessWidget {
  final int rating;
  final int dogCount;
  final int reviewsCount;
  final AppLocation appLocation;
  final String placeName;

  const NearbyPlacesItem({
    super.key,
    required this.rating,
    required this.dogCount,
    required this.reviewsCount,
    required this.appLocation,
    required this.placeName,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const CircleAvatar(
          radius: AppDouble.d21,
          backgroundImage: AssetImage(ImageAssets.park),
        ),
        const SizedBox(width: AppDouble.d8),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: .55.sw,
              child: Text(placeName,
                  style: TextStyles.font16Grey700Regular(),
                  maxLines: AppInt.i2,
                  overflow: TextOverflow.ellipsis),
            ),
            Row(
              children: [
                const SvgIcon(
                    color: ColorsManager.grey500,
                    assetName: ImageAssets.locationPin),
                const SizedBox(width: AppDouble.d5),
                FutureBuilder(
                  future: calculateDistance(appLocation),
                  builder: (context, snapshot) => Text(
                      '${double.parse((snapshot.data ?? AppDouble.d0).toStringAsFixed(1))} km ${LocaleKeys.home_away.tr()}',
                      style: TextStyles.font14Grey500Light()),
                ),
                const SizedBox(width: AppDouble.d7),
                const SvgIcon(
                    color: ColorsManager.grey500,
                    assetName: ImageAssets.animalLeg),
                const SizedBox(width: AppDouble.d4),
                Text('$dogCount ${LocaleKeys.home_dogs.tr()}',
                    style: TextStyles.font14Grey400Regular()),
              ],
            ),
          ],
        ),
        const Spacer(),
        Column(
          children: [
            RatingWidget(rating: rating),
            const SizedBox(height: AppDouble.d4),
            Text('($reviewsCount ${LocaleKeys.home_reviews.tr()})',
                style: TextStyles.font9Grey700Light()),
          ],
        ),
      ],
    );
  }
}
