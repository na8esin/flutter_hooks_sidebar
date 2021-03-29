import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'package:flutter_hooks_sidebar/flutter_hooks_sidebar.dart';

void main() {
  runApp(ProviderScope(child: MaterialApp(home: MyScaffold())));
}

class MyScaffold extends HookWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyHomePage(),
    );
  }
}

abstract class RoutePath {}

class ChapAPath extends RoutePath {}

class ChapBPath extends RoutePath {}

class ChapB1Path extends RoutePath {}

class ChapB2Path extends RoutePath {}

final tabs = [
  SidebarTab(
    routePath: ChapAPath(),
    // Stringでもいいかもしれない
    title: Text(
      'Chapter A',
      // なぜか効かない
      overflow: TextOverflow.ellipsis,
    ),
    iconData: Icons.android,
  ),
  SidebarTab(
      routePath: ChapBPath(),
      title: Text('Chap B'),
      iconData: Icons.note,
      children: [
        SidebarTab(
            routePath: ChapB1Path(),
            title: Text('Chap B1'),
            iconData: Icons.note),
        SidebarTab(
            routePath: ChapB2Path(),
            title: Text('Chap B2'),
            iconData: Icons.note),
      ])
];

final sidebarControllerProvider = StateNotifierProvider.autoDispose((
  ref,
) {
  return SidebarController<RoutePath>(SidebarParameter<RoutePath>(
    /// childがあるときは[1]のような一階層の指定はだめ
    /// StateNotifierProviderの初期化との整合性を取るのが面倒
    activeTabIndices: [1, 1],
    tabs: tabs,
  ));
});

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final controller = useProvider(sidebarControllerProvider);
    return Row(
      children: [
        Sidebar(
          controller: controller,
          tabs: tabs,
        ),
        VerticalDivider(thickness: 1, width: 1),
        Expanded(
          child: Center(
            child: MyMainWidget(),
          ),
        )
      ],
    );
  }
}

class MyMainWidget extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _con = useProvider(sidebarControllerProvider.state);
    return Container(
      child: Text('${_con.routePath}'),
    );
  }
}
