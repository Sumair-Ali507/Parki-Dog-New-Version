import 'package:parki_dog/features/profile/export/profile_export.dart';

class DogImage extends StatelessWidget {
  final VoidCallback? onTap;
  final String imageAsset;
  final File? uploadedImage;
  final String dogName;
  final String breed;
  final bool isMale;

  const DogImage({
    super.key,
    this.onTap,
    required this.imageAsset,
    this.uploadedImage,
    required this.dogName,
    required this.breed,
    required this.isMale,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        InkWell(
          radius: AppDouble.d40,
          onTap: onTap,
          child: Stack(
            alignment: AlignmentDirectional.bottomEnd,
            children: [
              CircleAvatar(
                radius: AppDouble.d40,
                backgroundImage: uploadedImage != null
                    ? FileImage(uploadedImage!)
                    : AssetImage(imageAsset) as ImageProvider,
              ),
              const CircleAvatar(
                radius: AppDouble.d10,
                backgroundColor: ColorsManager.primary100,
                child: SvgIcon(
                    color: ColorsManager.primaryColor,
                    assetName: ImageAssets.camera),
              ),
            ],
          ),
        ),
        const SizedBox(height: AppDouble.d8),
        Text(
          dogName,
          style: TextStyles.font16Grey600SemiBold(),
        ),
        const SizedBox(height: AppDouble.d4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Text(
                breed,
                style: TextStyles.font12Grey400Regular(),
                overflow: TextOverflow.ellipsis,
                maxLines: AppInt.i1,
              ),
            ),
            const SizedBox(width: AppDouble.d4),
            SvgIcon(
                color: ColorsManager.secondaryColor,
                assetName: isMale ? ImageAssets.man : ImageAssets.woman),
          ],
        ),
      ],
    );
  }
}
