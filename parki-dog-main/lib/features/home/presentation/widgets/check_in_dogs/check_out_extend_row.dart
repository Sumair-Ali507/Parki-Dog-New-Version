import 'package:parki_dog/features/home/export/home_export.dart';

class CheckOutExtendRow extends StatelessWidget {
  final VoidCallback? checkOutOnTap;
  final VoidCallback? extendTimeOnTap;

  const CheckOutExtendRow({
    super.key,
    this.checkOutOnTap,
    this.extendTimeOnTap,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsetsDirectional.only(
          start: AppDouble.d16, end: AppDouble.d16, bottom: AppDouble.d16),
      child: Row(
        children: [
          Expanded(
            child: OutlinedButton(
              onPressed: checkOutOnTap,
              style: OutlinedButton.styleFrom(
                backgroundColor: Colors.transparent,
                shape: const StadiumBorder(),
                side: const BorderSide(
                    color: ColorsManager.greyBorder, width: AppDouble.d1),
                textStyle: TextStyles.font14Black94Regular(),
              ),
              child: const Text(LocaleKeys.home_checkout).tr(),
            ),
          ),
          const SizedBox(width: AppDouble.d16),
          Expanded(
              child: ElevatedButton(
            onPressed: extendTimeOnTap,
            style: ElevatedButton.styleFrom(
                backgroundColor: ColorsManager.primary600,
                textStyle: TextStyles.font14WhiteMedium(),
                shape: const StadiumBorder(),
                padding: EdgeInsets.zero),
            child: const Text(LocaleKeys.home_extendTime).tr(),
          )),
        ],
      ),
    );
  }
}
