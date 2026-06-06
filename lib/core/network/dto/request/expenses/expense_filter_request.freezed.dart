// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_filter_request.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseFilterRequest {

@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get dateFrom;@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? get dateTo; int get pageNumber; int get pageSize;
/// Create a copy of ExpenseFilterRequest
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseFilterRequestCopyWith<ExpenseFilterRequest> get copyWith => _$ExpenseFilterRequestCopyWithImpl<ExpenseFilterRequest>(this as ExpenseFilterRequest, _$identity);

  /// Serializes this ExpenseFilterRequest to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseFilterRequest&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateFrom,dateTo,pageNumber,pageSize);

@override
String toString() {
  return 'ExpenseFilterRequest(dateFrom: $dateFrom, dateTo: $dateTo, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class $ExpenseFilterRequestCopyWith<$Res>  {
  factory $ExpenseFilterRequestCopyWith(ExpenseFilterRequest value, $Res Function(ExpenseFilterRequest) _then) = _$ExpenseFilterRequestCopyWithImpl;
@useResult
$Res call({
@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? dateFrom,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? dateTo, int pageNumber, int pageSize
});




}
/// @nodoc
class _$ExpenseFilterRequestCopyWithImpl<$Res>
    implements $ExpenseFilterRequestCopyWith<$Res> {
  _$ExpenseFilterRequestCopyWithImpl(this._self, this._then);

  final ExpenseFilterRequest _self;
  final $Res Function(ExpenseFilterRequest) _then;

/// Create a copy of ExpenseFilterRequest
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? dateFrom = freezed,Object? dateTo = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_self.copyWith(
dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseFilterRequest].
extension ExpenseFilterRequestPatterns on ExpenseFilterRequest {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseFilterRequest value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseFilterRequest() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseFilterRequest value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseFilterRequest():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseFilterRequest value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseFilterRequest() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? dateFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? dateTo,  int pageNumber,  int pageSize)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseFilterRequest() when $default != null:
return $default(_that.dateFrom,_that.dateTo,_that.pageNumber,_that.pageSize);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? dateFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? dateTo,  int pageNumber,  int pageSize)  $default,) {final _that = this;
switch (_that) {
case _ExpenseFilterRequest():
return $default(_that.dateFrom,_that.dateTo,_that.pageNumber,_that.pageSize);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function(@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? dateFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson)  DateTime? dateTo,  int pageNumber,  int pageSize)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseFilterRequest() when $default != null:
return $default(_that.dateFrom,_that.dateTo,_that.pageNumber,_that.pageSize);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseFilterRequest implements ExpenseFilterRequest {
  const _ExpenseFilterRequest({@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.dateFrom, @JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) this.dateTo, this.pageNumber = 1, this.pageSize = 10});
  factory _ExpenseFilterRequest.fromJson(Map<String, dynamic> json) => _$ExpenseFilterRequestFromJson(json);

@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? dateFrom;
@override@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) final  DateTime? dateTo;
@override@JsonKey() final  int pageNumber;
@override@JsonKey() final  int pageSize;

/// Create a copy of ExpenseFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseFilterRequestCopyWith<_ExpenseFilterRequest> get copyWith => __$ExpenseFilterRequestCopyWithImpl<_ExpenseFilterRequest>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseFilterRequestToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseFilterRequest&&(identical(other.dateFrom, dateFrom) || other.dateFrom == dateFrom)&&(identical(other.dateTo, dateTo) || other.dateTo == dateTo)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,dateFrom,dateTo,pageNumber,pageSize);

@override
String toString() {
  return 'ExpenseFilterRequest(dateFrom: $dateFrom, dateTo: $dateTo, pageNumber: $pageNumber, pageSize: $pageSize)';
}


}

/// @nodoc
abstract mixin class _$ExpenseFilterRequestCopyWith<$Res> implements $ExpenseFilterRequestCopyWith<$Res> {
  factory _$ExpenseFilterRequestCopyWith(_ExpenseFilterRequest value, $Res Function(_ExpenseFilterRequest) _then) = __$ExpenseFilterRequestCopyWithImpl;
@override @useResult
$Res call({
@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? dateFrom,@JsonKey(toJson: _dateOnlyToJson, fromJson: _dateOnlyFromJson) DateTime? dateTo, int pageNumber, int pageSize
});




}
/// @nodoc
class __$ExpenseFilterRequestCopyWithImpl<$Res>
    implements _$ExpenseFilterRequestCopyWith<$Res> {
  __$ExpenseFilterRequestCopyWithImpl(this._self, this._then);

  final _ExpenseFilterRequest _self;
  final $Res Function(_ExpenseFilterRequest) _then;

/// Create a copy of ExpenseFilterRequest
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? dateFrom = freezed,Object? dateTo = freezed,Object? pageNumber = null,Object? pageSize = null,}) {
  return _then(_ExpenseFilterRequest(
dateFrom: freezed == dateFrom ? _self.dateFrom : dateFrom // ignore: cast_nullable_to_non_nullable
as DateTime?,dateTo: freezed == dateTo ? _self.dateTo : dateTo // ignore: cast_nullable_to_non_nullable
as DateTime?,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,
  ));
}


}

// dart format on
