import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'sidebar_tab.dart';

part 'sidebar_parameter.freezed.dart';

@freezed
abstract class SidebarParameter with _$SidebarParameter {
  factory SidebarParameter(
      {List<int>? activeTabIndices,
      required List<SidebarTab> tabs}) = _SidebarParameter;
}
