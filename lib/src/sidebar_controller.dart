import 'dart:math' show min;

import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'sidebar_parameter.dart';
import 'sidebar_tab.dart';

class SidebarController<T> extends StateNotifier<SidebarParameter<T>> {
  // ここでのstateはactiveTab
  SidebarController(SidebarParameter<T> state) : super(state) {
    init();
  }

  SidebarTab<T> findRoutePath<T>(
      List<SidebarTab<T>> tabs, List<int> activeTabIndices) {
    SidebarTab<T>? find;
    for (int i = 0; i < activeTabIndices.length; i++) {
      // 初期化
      if (find == null) find = tabs[activeTabIndices[i]];

      if (find.children != null && i + 1 < activeTabIndices.length)
        find = find.children![activeTabIndices[i + 1]];
    }
    return find!;
  }

  /// 一番上の階層だと[0]とか[1]
  /// 二番目の階層だと[0, 0]とか[0, 1]
  void setActiveTabIndices(List<int> newIndices) {
    state = state.copyWith(activeTabIndices: newIndices);
  }

  // 最初のタブを見つけだしてアクティブにする
  // routePathもここで見つけ出しstateに設定する
  void init() {
    if (state.activeTabIndices == null) {
      // 例えば[0, 0]が返ってくる
      List<int> newActiveTabIndices = _getFirstTabIndex(state.tabs, []);
      if (newActiveTabIndices.length > 0) {
        setActiveTabIndices(newActiveTabIndices);
      }
    }
    final initialRoutePath = findRoutePath(state.tabs, state.activeTabIndices!);
    state = state.copyWith(routePath: initialRoutePath.routePath);
  }

  /// こいつは初期化処理にしか使われてない
  /// メソッド名通り最初のタブしか処理されてない
  ///
  /// return:
  ///   indices: 最初のタブが何階層か。
  List<int> _getFirstTabIndex(List<SidebarTab> tabs, List<int> indices) {
    if (tabs.length > 0) {
      SidebarTab firstTab = tabs[0];
      indices.add(0);

      if (firstTab.children != null) {
        // 再帰的に実行
        indices = _getFirstTabIndex(firstTab.children!, indices);
      }
    }
    return indices;
  }

  /// _indicesMatchはListTileとCustomExpansionTileのselectedを決めるための関数
  /// _indices, activeTabIndices
  /// a[i] とb[i]が一つでも合わなければfalse。
  /// 全部合えばtrue
  /// ただし、はみ出した分は、比較対象にならない
  ///
  /// aとbのlengthが合わないのはどんな場合？
  ///
  /// 一回しまって、また開いたとしても選択中のものは選択中になる。
  /// インデックスだけを別でstateで持ってるから？
  bool isSelected(List<int> a) {
    final b = state.activeTabIndices;
    if (b == null) return false;
    for (int i = 0; i < min(a.length, b.length); i++) {
      if (a[i] != b[i]) return false;
    }
    return true;
  }

  get routePath => state.routePath;
  setRoutePath(T v) => state = state.copyWith(routePath: v);
}
