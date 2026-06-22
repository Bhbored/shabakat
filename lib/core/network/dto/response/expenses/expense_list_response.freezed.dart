// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'expense_list_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ExpenseListResponse {

 List<ExpenseResponse> get data; int get totalCount; int get pageNumber; int get pageSize; int get totalPages; bool get hasPreviousPage; bool get hasNextPage; double get totalAmount;
/// Create a copy of ExpenseListResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ExpenseListResponseCopyWith<ExpenseListResponse> get copyWith => _$ExpenseListResponseCopyWithImpl<ExpenseListResponse>(this as ExpenseListResponse, _$identity);

  /// Serializes this ExpenseListResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ExpenseListResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),totalCount,pageNumber,pageSize,totalPages,hasPreviousPage,hasNextPage,totalAmount);

@override
String toString() {
  return 'ExpenseListResponse(data: $data, totalCount: $totalCount, pageNumber: $pageNumber, pageSize: $pageSize, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class $ExpenseListResponseCopyWith<$Res>  {
  factory $ExpenseListResponseCopyWith(ExpenseListResponse value, $Res Function(ExpenseListResponse) _then) = _$ExpenseListResponseCopyWithImpl;
@useResult
$Res call({
 List<ExpenseResponse> data, int totalCount, int pageNumber, int pageSize, int totalPages, bool hasPreviousPage, bool hasNextPage, double totalAmount
});




}
/// @nodoc
class _$ExpenseListResponseCopyWithImpl<$Res>
    implements $ExpenseListResponseCopyWith<$Res> {
  _$ExpenseListResponseCopyWithImpl(this._self, this._then);

  final ExpenseListResponse _self;
  final $Res Function(ExpenseListResponse) _then;

/// Create a copy of ExpenseListResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? totalCount = null,Object? pageNumber = null,Object? pageSize = null,Object? totalPages = null,Object? hasPreviousPage = null,Object? hasNextPage = null,Object? totalAmount = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<ExpenseResponse>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}

}


/// Adds pattern-matching-related methods to [ExpenseListResponse].
extension ExpenseListResponsePatterns on ExpenseListResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ExpenseListResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ExpenseListResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ExpenseListResponse value)  $default,){
final _that = this;
switch (_that) {
case _ExpenseListResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ExpenseListResponse value)?  $default,){
final _that = this;
switch (_that) {
case _ExpenseListResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<ExpenseResponse> data,  int totalCount,  int pageNumber,  int pageSize,  int totalPages,  bool hasPreviousPage,  bool hasNextPage,  double totalAmount)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ExpenseListResponse() when $default != null:
return $default(_that.data,_that.totalCount,_that.pageNumber,_that.pageSize,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage,_that.totalAmount);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<ExpenseResponse> data,  int totalCount,  int pageNumber,  int pageSize,  int totalPages,  bool hasPreviousPage,  bool hasNextPage,  double totalAmount)  $default,) {final _that = this;
switch (_that) {
case _ExpenseListResponse():
return $default(_that.data,_that.totalCount,_that.pageNumber,_that.pageSize,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage,_that.totalAmount);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<ExpenseResponse> data,  int totalCount,  int pageNumber,  int pageSize,  int totalPages,  bool hasPreviousPage,  bool hasNextPage,  double totalAmount)?  $default,) {final _that = this;
switch (_that) {
case _ExpenseListResponse() when $default != null:
return $default(_that.data,_that.totalCount,_that.pageNumber,_that.pageSize,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage,_that.totalAmount);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ExpenseListResponse implements ExpenseListResponse {
  const _ExpenseListResponse({required final  List<ExpenseResponse> data, required this.totalCount, required this.pageNumber, required this.pageSize, required this.totalPages, required this.hasPreviousPage, required this.hasNextPage, required this.totalAmount}): _data = data;
  factory _ExpenseListResponse.fromJson(Map<String, dynamic> json) => _$ExpenseListResponseFromJson(json);

 final  List<ExpenseResponse> _data;
@override List<ExpenseResponse> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override final  int totalCount;
@override final  int pageNumber;
@override final  int pageSize;
@override final  int totalPages;
@override final  bool hasPreviousPage;
@override final  bool hasNextPage;
@override final  double totalAmount;

/// Create a copy of ExpenseListResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ExpenseListResponseCopyWith<_ExpenseListResponse> get copyWith => __$ExpenseListResponseCopyWithImpl<_ExpenseListResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ExpenseListResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ExpenseListResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage)&&(identical(other.totalAmount, totalAmount) || other.totalAmount == totalAmount));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),totalCount,pageNumber,pageSize,totalPages,hasPreviousPage,hasNextPage,totalAmount);

@override
String toString() {
  return 'ExpenseListResponse(data: $data, totalCount: $totalCount, pageNumber: $pageNumber, pageSize: $pageSize, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage, totalAmount: $totalAmount)';
}


}

/// @nodoc
abstract mixin class _$ExpenseListResponseCopyWith<$Res> implements $ExpenseListResponseCopyWith<$Res> {
  factory _$ExpenseListResponseCopyWith(_ExpenseListResponse value, $Res Function(_ExpenseListResponse) _then) = __$ExpenseListResponseCopyWithImpl;
@override @useResult
$Res call({
 List<ExpenseResponse> data, int totalCount, int pageNumber, int pageSize, int totalPages, bool hasPreviousPage, bool hasNextPage, double totalAmount
});




}
/// @nodoc
class __$ExpenseListResponseCopyWithImpl<$Res>
    implements _$ExpenseListResponseCopyWith<$Res> {
  __$ExpenseListResponseCopyWithImpl(this._self, this._then);

  final _ExpenseListResponse _self;
  final $Res Function(_ExpenseListResponse) _then;

/// Create a copy of ExpenseListResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? totalCount = null,Object? pageNumber = null,Object? pageSize = null,Object? totalPages = null,Object? hasPreviousPage = null,Object? hasNextPage = null,Object? totalAmount = null,}) {
  return _then(_ExpenseListResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<ExpenseResponse>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,totalAmount: null == totalAmount ? _self.totalAmount : totalAmount // ignore: cast_nullable_to_non_nullable
as double,
  ));
}


}

// dart format on
