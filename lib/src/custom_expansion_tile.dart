import 'package:flutter/material.dart';

/// このクラスはflutter_sidebarから修正してない
class CustomExpansionTile extends StatefulWidget {
  // オプションがこれだけしかないから、
  // 子要素を選択した時にヘッダーが選択される仕組みはsidebarの方なんだろうね
  const CustomExpansionTile({
    Key? key,
    this.leading,
    required this.title,
    this.subtitle,
    this.onExpansionChanged,
    this.children = const <Widget>[],
    this.trailing,
    this.selected = false,
    this.initiallyExpanded = false,
    this.maintainState = false,
    this.tilePadding,
    this.expandedCrossAxisAlignment,
    this.expandedAlignment,
    this.childrenPadding,
  })  : assert(initiallyExpanded != null),
        assert(maintainState != null),
        assert(
          expandedCrossAxisAlignment != CrossAxisAlignment.baseline,
          'CrossAxisAlignment.baseline is not supported since the expanded children '
          'are aligned in a column, not a row. Try to use another constant.',
        ),
        super(key: key);

  final Widget? leading;
  final Widget title;
  final Widget? subtitle;
  final ValueChanged<bool>? onExpansionChanged;
  final List<Widget> children;
  final Widget? trailing;
  final bool selected;
  final bool initiallyExpanded;
  final bool maintainState;
  final EdgeInsetsGeometry? tilePadding;
  final Alignment? expandedAlignment;
  final CrossAxisAlignment? expandedCrossAxisAlignment;
  final EdgeInsetsGeometry? childrenPadding;

  @override
  _CustomExpansionTileState createState() => _CustomExpansionTileState();
}

class _CustomExpansionTileState extends State<CustomExpansionTile>
    with SingleTickerProviderStateMixin {
  static final Animatable<double> _easeInTween =
      CurveTween(curve: Curves.easeIn);
  static final Animatable<double> _halfTween =
      Tween<double>(begin: 0.0, end: 0.5);
  static final _expansionDuration = Duration(milliseconds: 200);

  late AnimationController _controller;
  late Animation<double> _iconTurns;
  late Animation<double> _heightFactor;

  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(duration: _expansionDuration, vsync: this);
    _heightFactor = _controller.drive(_easeInTween);
    _iconTurns = _controller.drive(_halfTween.chain(_easeInTween));

    _isExpanded = PageStorage.of(context)?.readState(context) as bool? ??
        widget.initiallyExpanded;
    if (_isExpanded) _controller.value = 1.0;
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void _handleTap() {
    setState(() {
      _isExpanded = !_isExpanded;
      if (_isExpanded) {
        _controller.forward();
      } else {
        _controller.reverse().then<void>((void value) {
          if (!mounted) return;
          setState(() {
            // Rebuild without widget.children.
          });
        });
      }
      PageStorage.of(context)?.writeState(context, _isExpanded);
    });
    if (widget.onExpansionChanged != null)
      widget.onExpansionChanged!(_isExpanded);
  }

  // ここのchildはAnimatedBuilderのchildに指定するchild
  Widget _buildChildren(BuildContext context, Widget? child) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          // ヘッダーの部分も結局はListTile
          ListTile(
            selected: widget.selected,
            onTap: _handleTap,
            contentPadding: widget.tilePadding,
            leading: widget.leading,
            title: widget.title,
            subtitle: widget.subtitle,
            trailing: widget.trailing ??
                RotationTransition(
                  turns: _iconTurns,
                  child: const Icon(Icons.expand_more),
                ),
          ),
          ClipRect(
            child: Align(
              alignment: widget.expandedAlignment ?? Alignment.center,
              heightFactor: _heightFactor.value,
              child: child,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final bool closed = !_isExpanded && _controller.isDismissed;
    // maintainState: 見えないときの子要素を保持するかどうか
    final bool shouldRemoveChildren = closed && !widget.maintainState;

    // 下の階層の要素達
    // Offstage: widgetを非表示にする
    final Widget result = Offstage(
        child: TickerMode(
          child: Padding(
            padding: widget.childrenPadding ?? EdgeInsets.zero,
            child: Column(
              crossAxisAlignment: widget.expandedCrossAxisAlignment ??
                  CrossAxisAlignment.center,
              children: widget.children,
            ),
          ),
          enabled: !closed,
        ),
        offstage: closed);

    return AnimatedBuilder(
      animation: _controller.view,
      builder: _buildChildren,
      // maintainState=falseならnullにして完全消去
      child: shouldRemoveChildren ? null : result,
    );
  }
}
