import 'package:flutter/material.dart';

/// titleとchildrenを持ったwidget
class SidebarTab<T> {
  SidebarTab(
      {this.iconData = Icons.crop_square,
      this.key,
      required this.title,
      required this.routePath,
      this.children});
  final List<SidebarTab<T>>? children;
  final Widget title;
  // icon
  final IconData iconData;
  final Key? key;
  final T routePath;
}
