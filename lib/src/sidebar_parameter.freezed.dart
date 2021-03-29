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

  _SidebarParameter call(
      {List<int>? activeTabIndices, required List<SidebarTab> tabs}) {
    return _SidebarParameter(
      activeTabIndices: activeTabIndices,
      tabs: tabs,
    );
  }
}

/// @nodoc
const $SidebarParameter = _$SidebarParameterTearOff();

/// @nodoc
mixin _$SidebarParameter {
  List<int>? get activeTabIndices => throw _privateConstructorUsedError;
  List<SidebarTab> get tabs => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $SidebarParameterCopyWith<SidebarParameter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SidebarParameterCopyWith<$Res> {
  factory $SidebarParameterCopyWith(
          SidebarParameter value, $Res Function(SidebarParameter) then) =
      _$SidebarParameterCopyWithImpl<$Res>;
  $Res call({List<int>? activeTabIndices, List<SidebarTab> tabs});
}

/// @nodoc
class _$SidebarParameterCopyWithImpl<$Res>
    implements $SidebarParameterCopyWith<$Res> {
  _$SidebarParameterCopyWithImpl(this._value, this._then);

  final SidebarParameter _value;
  // ignore: unused_field
  final $Res Function(SidebarParameter) _then;

  @override
  $Res call({
    Object? activeTabIndices = freezed,
    Object? tabs = freezed,
  }) {
    return _then(_value.copyWith(
      activeTabIndices: activeTabIndices == freezed
          ? _value.activeTabIndices
          : activeTabIndices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      tabs: tabs == freezed
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<SidebarTab>,
    ));
  }
}

/// @nodoc
abstract class _$SidebarParameterCopyWith<$Res>
    implements $SidebarParameterCopyWith<$Res> {
  factory _$SidebarParameterCopyWith(
          _SidebarParameter value, $Res Function(_SidebarParameter) then) =
      __$SidebarParameterCopyWithImpl<$Res>;
  @override
  $Res call({List<int>? activeTabIndices, List<SidebarTab> tabs});
}

/// @nodoc
class __$SidebarParameterCopyWithImpl<$Res>
    extends _$SidebarParameterCopyWithImpl<$Res>
    implements _$SidebarParameterCopyWith<$Res> {
  __$SidebarParameterCopyWithImpl(
      _SidebarParameter _value, $Res Function(_SidebarParameter) _then)
      : super(_value, (v) => _then(v as _SidebarParameter));

  @override
  _SidebarParameter get _value => super._value as _SidebarParameter;

  @override
  $Res call({
    Object? activeTabIndices = freezed,
    Object? tabs = freezed,
  }) {
    return _then(_SidebarParameter(
      activeTabIndices: activeTabIndices == freezed
          ? _value.activeTabIndices
          : activeTabIndices // ignore: cast_nullable_to_non_nullable
              as List<int>?,
      tabs: tabs == freezed
          ? _value.tabs
          : tabs // ignore: cast_nullable_to_non_nullable
              as List<SidebarTab>,
    ));
  }
}

/// @nodoc
class _$_SidebarParameter
    with DiagnosticableTreeMixin
    implements _SidebarParameter {
  _$_SidebarParameter({this.activeTabIndices, required this.tabs});

  @override
  final List<int>? activeTabIndices;
  @override
  final List<SidebarTab> tabs;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'SidebarParameter(activeTabIndices: $activeTabIndices, tabs: $tabs)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'SidebarParameter'))
      ..add(DiagnosticsProperty('activeTabIndices', activeTabIndices))
      ..add(DiagnosticsProperty('tabs', tabs));
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other is _SidebarParameter &&
            (identical(other.activeTabIndices, activeTabIndices) ||
                const DeepCollectionEquality()
                    .equals(other.activeTabIndices, activeTabIndices)) &&
            (identical(other.tabs, tabs) ||
                const DeepCollectionEquality().equals(other.tabs, tabs)));
  }

  @override
  int get hashCode =>
      runtimeType.hashCode ^
      const DeepCollectionEquality().hash(activeTabIndices) ^
      const DeepCollectionEquality().hash(tabs);

  @JsonKey(ignore: true)
  @override
  _$SidebarParameterCopyWith<_SidebarParameter> get copyWith =>
      __$SidebarParameterCopyWithImpl<_SidebarParameter>(this, _$identity);
}

abstract class _SidebarParameter implements SidebarParameter {
  factory _SidebarParameter(
      {List<int>? activeTabIndices,
      required List<SidebarTab> tabs}) = _$_SidebarParameter;

  @override
  List<int>? get activeTabIndices => throw _privateConstructorUsedError;
  @override
  List<SidebarTab> get tabs => throw _privateConstructorUsedError;
  @override
  @JsonKey(ignore: true)
  _$SidebarParameterCopyWith<_SidebarParameter> get copyWith =>
      throw _privateConstructorUsedError;
}
