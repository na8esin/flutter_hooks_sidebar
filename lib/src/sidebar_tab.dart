import 'package:flutter/material.dart';

/// titleとchildrenを持ったwidget
class SidebarTab<T> {
  SidebarTab(
      {required this.iconData,
      this.key,
      required this.title,
      required this.routePath,
      this.children});
  final List<SidebarTab>? children;
  final Widget title;
  // icon
  final IconData iconData;
  final Key? key;
  final T routePath;
}
