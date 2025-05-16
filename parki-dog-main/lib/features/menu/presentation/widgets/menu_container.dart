import 'package:parki_dog/features/menu/export/menu_export.dart';

class MenuContainer extends StatelessWidget {
  final Widget child;

  const MenuContainer({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: const EdgeInsets.all(AppDouble.d16),
        decoration: BoxDecoration(
          color: ColorsManager.grey50,
          borderRadius: BorderRadius.circular(AppDouble.d16),
        ),
        child: child);
  }
}
