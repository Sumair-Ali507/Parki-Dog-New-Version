import 'package:flutter/material.dart';

class CustomDrawer extends StatelessWidget {
  final DrawerHeader? drawerHeader;
  final Color? bgColor;
  final Color? surfaceTintColor;
  final double? width;
  final double? elevation;
  final ShapeBorder? shape;

  ///prefer widget to be ListTile
  final List<Widget> items;

  const CustomDrawer(
      {super.key,
      this.drawerHeader,
      required this.items,
      this.bgColor,
      this.surfaceTintColor,
      this.width,
      this.elevation,
      this.shape});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: bgColor,
      surfaceTintColor: surfaceTintColor,
      width: width,
      shape: shape,
      elevation: elevation,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          if (drawerHeader != null) drawerHeader!,
          ...items,
          // Add more ListTile or other widgets here
        ],
      ),
    );
  }
}
