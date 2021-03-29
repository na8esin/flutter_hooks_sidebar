// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

part of 'sidebar_parameter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$SidebarParameterTearOff {
  const _$SidebarParameterTearOff();

  _SidebarParameter<T> call<T>(
      {List<int>? activeTabIndices,
      T? routePath,
      required List<SidebarTab<T>> tabs}) {
    return _SidebarParameter<T>(
      activeTabIndices: activeTabIndices,
      routePath: routePath,
      tabs: tabs,
    );
  }
}

/// @nodoc
const $SidebarParameter = _$SidebarParameterTearOff();

/// @nodoc
mixin _$SidebarParameter<T> {
  List<int>? get activeTabIndices => throw _privateConstructorUsedError;
  T? get routePath =>
      throw _privateConstructorUsedError; // stateではあるが、parameterではない
  List<SidebarTab<T>> get tabs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SidebarParameterCopyWith<T, SidebarParameter<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidebarParameterCopyWith<T, $Res> {
  factory $SidebarParameterCopyWith(
          SidebarParameter<T> value, $Res Function(SidebarParameter<T>) then) =
      _$SidebarParameterCopyWithImpl<T, $Res>;
  $Res call(
      {List<int>? activeTabIndices, T? routePath, List<SidebarTab<T>> tabs});
}

/// @nodoc
class _$SidebarParameterCopyWithImpl<T, $Res>
    implements $SidebarParameterCopyWith<T, $Res> {
  _$SidebarParameterCopyWithImpl(this._value, this._then);

  final SidebarParameter<T> _value;
  // ignore: unused_field
  final $Res Function(SidebarParameter<T>) _then;

  @override
  $Res call({
    Object? activeTabIndices = freezed,
    Object? routePath = freezed,
    Object? tabs = freezed,
  }) {
    return _then(_value.copyWith(
      activeTabIndices: activeTabIndices == freezed
          ? _value.activeTabIndices
          : activeTabIndices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      routePath: routePath == freezed
          ? _value.routePath
          : routePath // ignore: cast_nullable_to_non_nullable
              as T?,
      tabs: tabs == freezed
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<SidebarTab<T>>,
    ));
  }
}

/// @nodoc
abstract class _$SidebarParameterCopyWith<T, $Res>
    implements $SidebarParameterCopyWith<T, $Res> {
  factory _$SidebarParameterCopyWith(_SidebarParameter<T> value,
          $Res Function(_SidebarParameter<T>) then) =
      __$SidebarParameterCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {List<int>? activeTabIndices, T? routePath, List<SidebarTab<T>> tabs});
}

/// @nodoc
class __$SidebarParameterCopyWithImpl<T, $Res>
    extends _$SidebarParameterCopyWithImpl<T, $Res>
    implements _$SidebarParameterCopyWith<T, $Res> {
  __$SidebarParameterCopyWithImpl(
      _SidebarParameter<T> _value, $Res Function(_SidebarParameter<T>) _then)
      : super(_value, (v) => _then(v as _SidebarParameter<T>));

  @override
  _SidebarParameter<T> get _value => super._value as _SidebarParameter<T>;

  @override
  $Res call({
    Object? activeTabIndices = freezed,
    Object? routePath = freezed,
    Object? tabs = freezed,
  }) {
    return _then(_SidebarParameter<T>(
      activeTabIndices: activeTabIndices == freezed
          ? _value.activeTabIndices
          : activeTabIndices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      routePath: routePath == freezed
          ? _value.routePath
          : routePath // ignore: cast_nullable_to_non_nullable
              as T?,
      tabs: tabs == freezed
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<SidebarTab<T>>,
    ));
  }
}

/// @nodoc
class _$_SidebarParameter<T>
    with DiagnosticableTreeMixin
    implements _SidebarParameter<T> {
  _$_SidebarParameter(
      {this.activeTabIndices, this.routePath, required this.tabs});

  @override
  final List<int>? activeTabIndices;
  @override
  final T? routePath;
  @override // stateではあるが、parameterではない
  final List<SidebarTab<T>> tabs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SidebarParameter<$T>(activeTabIndices: $activeTabIndices, routePath: $routePath, tabs: $tabs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SidebarParameter<$T>'))
      ..add(DiagnosticsProperty('activeTabIndices', activeTabIndices))
      ..add(DiagnosticsProperty('routePath', routePath))
      ..add(DiagnosticsProperty('tabs', tabs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SidebarParameter<T> &&
            (identical(other.activeTabIndices, activeTabIndices) ||
                const DeepCollectionEquality()
                    .equals(other.activeTabIndices, activeTabIndices)) &&
            (identical(other.routePath, routePath) ||
                const DeepCollectionEquality()
                    .equals(other.routePath, routePath)) &&
            (identical(other.tabs, tabs) ||
                const DeepCollectionEquality().equals(other.tabs, tabs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(activeTabIndices) ^
      const DeepCollectionEquality().hash(routePath) ^
      const DeepCollectionEquality().hash(tabs);

  @JsonKey(ignore: true)
  @override
  _$SidebarParameterCopyWith<T, _SidebarParameter<T>> get copyWith =>
      __$SidebarParameterCopyWithImpl<T, _SidebarParameter<T>>(
          this, _$identity);
}

abstract class _SidebarParameter<T> implements SidebarParameter<T> {
  factory _SidebarParameter(
      {List<int>? activeTabIndices,
      T? routePath,
      required List<SidebarTab<T>> tabs}) = _$_SidebarParameter<T>;

  @override
  List<int>? get activeTabIndices => throw _privateConstructorUsedError;
  @override
  T? get routePath => throw _privateConstructorUsedError;
  @override // stateではあるが、parameterではない
  List<SidebarTab<T>> get tabs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SidebarParameterCopyWith<T, _SidebarParameter<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
