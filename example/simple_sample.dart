import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../lib/src/flutter_hooks_sidebar.dart';
import '../lib/src/sidebar_tab.dart';

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

class LeftMenuSelectedController extends StateNotifier<String> {
  LeftMenuSelectedController(state) : super(state);

  // onTabChangeに渡す
  setKey(Key tabId) {
    if (tabId is ValueKey<String>) state = tabId.value;
  }
}

class RoutePathController extends StateNotifier<RoutePath> {
  RoutePathController(state) : super(state);

  setRoutePath(RoutePath path) {
    state = path;
  }
}

abstract class RoutePath {}

class ChapAPath extends RoutePath {}

class ChapBPath extends RoutePath {}

class ChapB1Path extends RoutePath {}

class ChapB2Path extends RoutePath {}

final leftMenuSelectedProvider =
    StateNotifierProvider((ref) => LeftMenuSelectedController('Chap_B'));

class MyHomePage extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final _controller = useProvider(leftMenuSelectedProvider);

    // 一つしか無い場合は常に選択状態。
    // sidebarTabにPathを入れられるようにすれば便利？
    // ブラウザバックとうまく連動できるか？
    return Row(
      children: [
        Sidebar(
          tabs: [
            // objectKeyとかの方がいいかも？
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
              ],
            ),
          ],

          /// childがあるときは[1]のような一階層の指定はだめ
          activeTabIndices: [1, 1],
          // ListTileのonTapにそのまま渡される
          // 関数渡しにすると上手くいくが、ここで波括弧を展開して、
          // 中でcontrollerを処理しようとすると、
          // widgetの内部のstateまで干渉する感じ
          onTabChanged: _controller.setKey,
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
    final key = useProvider(leftMenuSelectedProvider.state);
    return Container(
      child: Text(key),
    );
  }
}
