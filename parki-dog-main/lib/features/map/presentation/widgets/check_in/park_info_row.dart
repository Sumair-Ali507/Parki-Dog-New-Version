import 'package:parki_dog/features/map/export/map_export.dart';

class ParkInfoRow extends StatelessWidget {
  final String parkName;
  final int rating;
  final int ratingCount;
  final String? safetyLabel; // New optional parameter to display "Safe"
  final String duration; // Retained for other uses if needed

  const ParkInfoRow({
    super.key,
    required this.parkName,
    required this.rating,
    required this.ratingCount,
    this.safetyLabel,
    required this.duration,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          Container(
            constraints: BoxConstraints(maxWidth: AppDouble.d0_3.sw),
            child: Text(
              parkName,
              style: TextStyles.font16Grey700SemiBold(),
              maxLines: AppInt.i1,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: AppDouble.d9),
          RatingWidget(rating: rating),
          const SizedBox(width: AppDouble.d4),
          Text(
            '($ratingCount)',
            style: TextStyles.font9Grey700Light(),
          ),
        ]),
        if (safetyLabel != null)
          Flexible(
            child: Text(
              safetyLabel!,
              maxLines: AppInt.i1,
              overflow: TextOverflow.ellipsis,
              style: TextStyles.font12RedDarkSemiBold(),
            ),
          ),
      ],
    );
  }
}