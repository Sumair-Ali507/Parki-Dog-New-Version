import 'package:parki_dog/core/utils/values_manager.dart';
import 'package:flutter/material.dart';

//adjust theme from theme manager
class ExpandableWidget extends StatelessWidget {
  final Widget title;
  final List<Widget> children;
  final Widget? leading;
  final Widget? trailing;
  final Color? backgroundColor;
  final Color? collapsedBackgroundColor;
  final Color? iconColor;
  final Color? collapsedIconColor;
  final Alignment? alignment;

  ///default 15

  final double borderRadius;

  ///default Colors.white

  final Color borderColor;

  ///default 12

  final double allPadding;
  const ExpandableWidget(
      {super.key,
      required this.title,
      required this.children,
      this.leading,
      this.trailing,
      this.backgroundColor,
      this.collapsedBackgroundColor,
      this.iconColor,
      this.collapsedIconColor,
      this.alignment,
      this.borderRadius = AppDouble.d15,
      this.borderColor = Colors.white,
      this.allPadding = AppDouble.d12});

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
        iconColor: iconColor,
        collapsedIconColor: collapsedIconColor,
        backgroundColor: backgroundColor,
        collapsedBackgroundColor: collapsedBackgroundColor,
        leading: leading,
        trailing: trailing,
        expandedAlignment: alignment,
        childrenPadding: EdgeInsets.all(allPadding),
        shape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        collapsedShape: RoundedRectangleBorder(
            side: BorderSide(color: borderColor),
            borderRadius: BorderRadius.circular(borderRadius)),
        title: title,
        children: children);
  }
}
