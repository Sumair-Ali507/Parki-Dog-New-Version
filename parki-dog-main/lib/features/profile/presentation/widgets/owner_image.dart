import 'package:parki_dog/features/profile/export/profile_export.dart';

class OwnerImage extends StatelessWidget {
  final VoidCallback? onTap;
  final String imageAsset;
  final File? uploadedImage;
  final String ownerName;

  const OwnerImage({
    super.key,
    this.onTap,
    required this.imageAsset,
    this.uploadedImage,
    required this.ownerName,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
          ownerName,
          style: TextStyles.font16Grey600SemiBold(),
        ),
        const SizedBox(height: AppDouble.d4),
        Text(
          LocaleKeys.profile_dogOwner,
          style: TextStyles.font12Grey400Regular(),
        ).tr(),
      ],
    );
  }
}
