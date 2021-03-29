import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

import 'sidebar_tab.dart';

part 'sidebar_parameter.freezed.dart';

@freezed
class SidebarParameter<T> with _$SidebarParameter<T> {
  factory SidebarParameter(
      {List<int>? activeTabIndices,
      T? routePath, // stateではあるが、parameterではない
      required List<SidebarTab<T>> tabs}) = _SidebarParameter;
}
