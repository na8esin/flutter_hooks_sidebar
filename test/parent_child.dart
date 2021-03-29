import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/material.dart';

import 'package:flutter_hooks_sidebar/flutter_hooks_sidebar.dart';

void main() {
  test('adds one to input values', () async {
    final calculator = Calculator();

    expect(calculator.execute([0]).routePath, isA<RoutePath1>());
    expect(calculator.execute([1]).routePath, isA<RoutePath2>());
    expect(calculator.execute([0, 0]).routePath, isA<RoutePath3>());
    expect(calculator.execute([1, 0]).routePath, isA<RoutePath4>());
    expect(calculator.execute([0, 1]).routePath, isA<RoutePath5>());
    expect(calculator.execute([1, 1]).routePath, isA<RoutePath6>());
  });
}

/// A Calculator.
class Calculator {
  SidebarTab<RoutePath> execute(List<int> defaultIndex) {
    List<SidebarTab<RoutePath>> tabs = [
      SidebarTab<RoutePath>(
          routePath: RoutePath1(),
          title: Text('path1'),
          children: [
            SidebarTab<RoutePath>(routePath: RoutePath3(), title: Text('***')),
            SidebarTab<RoutePath>(routePath: RoutePath5(), title: Text('***')),
          ]),
      SidebarTab<RoutePath>(
          routePath: RoutePath2(),
          title: Text('path2'),
          children: [
            SidebarTab<RoutePath>(routePath: RoutePath4(), title: Text('***')),
            SidebarTab<RoutePath>(routePath: RoutePath6(), title: Text('***')),
          ])
    ];

    final controller = SidebarController(SidebarParameter(
        activeTabIndices: defaultIndex, tabs: tabs, routePath: RoutePath1));

    return controller.findRoutePath(tabs, defaultIndex);
  }
}

abstract class RoutePath {}

class RoutePath1 extends RoutePath {
  @override
  String toString() {
    return 'RoutePath1';
  }
}

class RoutePath2 extends RoutePath {
  @override
  String toString() {
    return 'RoutePath2';
  }
}

class RoutePath3 extends RoutePath {}

class RoutePath4 extends RoutePath {}

class RoutePath5 extends RoutePath {}

class RoutePath6 extends RoutePath {}
