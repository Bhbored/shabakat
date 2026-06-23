// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'customer_list_summery_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CustomerListSummeryResponse {

 List<CustomerSummaryResponse> get data; int get totalCount; int get pageNumber; int get pageSize; int get totalPages; bool get hasPreviousPage; bool get hasNextPage;
/// Create a copy of CustomerListSummeryResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CustomerListSummeryResponseCopyWith<CustomerListSummeryResponse> get copyWith => _$CustomerListSummeryResponseCopyWithImpl<CustomerListSummeryResponse>(this as CustomerListSummeryResponse, _$identity);

  /// Serializes this CustomerListSummeryResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CustomerListSummeryResponse&&const DeepCollectionEquality().equals(other.data, data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(data),totalCount,pageNumber,pageSize,totalPages,hasPreviousPage,hasNextPage);

@override
String toString() {
  return 'CustomerListSummeryResponse(data: $data, totalCount: $totalCount, pageNumber: $pageNumber, pageSize: $pageSize, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class $CustomerListSummeryResponseCopyWith<$Res>  {
  factory $CustomerListSummeryResponseCopyWith(CustomerListSummeryResponse value, $Res Function(CustomerListSummeryResponse) _then) = _$CustomerListSummeryResponseCopyWithImpl;
@useResult
$Res call({
 List<CustomerSummaryResponse> data, int totalCount, int pageNumber, int pageSize, int totalPages, bool hasPreviousPage, bool hasNextPage
});




}
/// @nodoc
class _$CustomerListSummeryResponseCopyWithImpl<$Res>
    implements $CustomerListSummeryResponseCopyWith<$Res> {
  _$CustomerListSummeryResponseCopyWithImpl(this._self, this._then);

  final CustomerListSummeryResponse _self;
  final $Res Function(CustomerListSummeryResponse) _then;

/// Create a copy of CustomerListSummeryResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? data = null,Object? totalCount = null,Object? pageNumber = null,Object? pageSize = null,Object? totalPages = null,Object? hasPreviousPage = null,Object? hasNextPage = null,}) {
  return _then(_self.copyWith(
data: null == data ? _self.data : data // ignore: cast_nullable_to_non_nullable
as List<CustomerSummaryResponse>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [CustomerListSummeryResponse].
extension CustomerListSummeryResponsePatterns on CustomerListSummeryResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CustomerListSummeryResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CustomerListSummeryResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CustomerListSummeryResponse value)  $default,){
final _that = this;
switch (_that) {
case _CustomerListSummeryResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CustomerListSummeryResponse value)?  $default,){
final _that = this;
switch (_that) {
case _CustomerListSummeryResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<CustomerSummaryResponse> data,  int totalCount,  int pageNumber,  int pageSize,  int totalPages,  bool hasPreviousPage,  bool hasNextPage)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CustomerListSummeryResponse() when $default != null:
return $default(_that.data,_that.totalCount,_that.pageNumber,_that.pageSize,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<CustomerSummaryResponse> data,  int totalCount,  int pageNumber,  int pageSize,  int totalPages,  bool hasPreviousPage,  bool hasNextPage)  $default,) {final _that = this;
switch (_that) {
case _CustomerListSummeryResponse():
return $default(_that.data,_that.totalCount,_that.pageNumber,_that.pageSize,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<CustomerSummaryResponse> data,  int totalCount,  int pageNumber,  int pageSize,  int totalPages,  bool hasPreviousPage,  bool hasNextPage)?  $default,) {final _that = this;
switch (_that) {
case _CustomerListSummeryResponse() when $default != null:
return $default(_that.data,_that.totalCount,_that.pageNumber,_that.pageSize,_that.totalPages,_that.hasPreviousPage,_that.hasNextPage);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CustomerListSummeryResponse implements CustomerListSummeryResponse {
  const _CustomerListSummeryResponse({final  List<CustomerSummaryResponse> data = const [], this.totalCount = 0, this.pageNumber = 1, this.pageSize = 10, this.totalPages = 0, this.hasPreviousPage = false, this.hasNextPage = false}): _data = data;
  factory _CustomerListSummeryResponse.fromJson(Map<String, dynamic> json) => _$CustomerListSummeryResponseFromJson(json);

 final  List<CustomerSummaryResponse> _data;
@override@JsonKey() List<CustomerSummaryResponse> get data {
  if (_data is EqualUnmodifiableListView) return _data;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_data);
}

@override@JsonKey() final  int totalCount;
@override@JsonKey() final  int pageNumber;
@override@JsonKey() final  int pageSize;
@override@JsonKey() final  int totalPages;
@override@JsonKey() final  bool hasPreviousPage;
@override@JsonKey() final  bool hasNextPage;

/// Create a copy of CustomerListSummeryResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CustomerListSummeryResponseCopyWith<_CustomerListSummeryResponse> get copyWith => __$CustomerListSummeryResponseCopyWithImpl<_CustomerListSummeryResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CustomerListSummeryResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CustomerListSummeryResponse&&const DeepCollectionEquality().equals(other._data, _data)&&(identical(other.totalCount, totalCount) || other.totalCount == totalCount)&&(identical(other.pageNumber, pageNumber) || other.pageNumber == pageNumber)&&(identical(other.pageSize, pageSize) || other.pageSize == pageSize)&&(identical(other.totalPages, totalPages) || other.totalPages == totalPages)&&(identical(other.hasPreviousPage, hasPreviousPage) || other.hasPreviousPage == hasPreviousPage)&&(identical(other.hasNextPage, hasNextPage) || other.hasNextPage == hasNextPage));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_data),totalCount,pageNumber,pageSize,totalPages,hasPreviousPage,hasNextPage);

@override
String toString() {
  return 'CustomerListSummeryResponse(data: $data, totalCount: $totalCount, pageNumber: $pageNumber, pageSize: $pageSize, totalPages: $totalPages, hasPreviousPage: $hasPreviousPage, hasNextPage: $hasNextPage)';
}


}

/// @nodoc
abstract mixin class _$CustomerListSummeryResponseCopyWith<$Res> implements $CustomerListSummeryResponseCopyWith<$Res> {
  factory _$CustomerListSummeryResponseCopyWith(_CustomerListSummeryResponse value, $Res Function(_CustomerListSummeryResponse) _then) = __$CustomerListSummeryResponseCopyWithImpl;
@override @useResult
$Res call({
 List<CustomerSummaryResponse> data, int totalCount, int pageNumber, int pageSize, int totalPages, bool hasPreviousPage, bool hasNextPage
});




}
/// @nodoc
class __$CustomerListSummeryResponseCopyWithImpl<$Res>
    implements _$CustomerListSummeryResponseCopyWith<$Res> {
  __$CustomerListSummeryResponseCopyWithImpl(this._self, this._then);

  final _CustomerListSummeryResponse _self;
  final $Res Function(_CustomerListSummeryResponse) _then;

/// Create a copy of CustomerListSummeryResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? data = null,Object? totalCount = null,Object? pageNumber = null,Object? pageSize = null,Object? totalPages = null,Object? hasPreviousPage = null,Object? hasNextPage = null,}) {
  return _then(_CustomerListSummeryResponse(
data: null == data ? _self._data : data // ignore: cast_nullable_to_non_nullable
as List<CustomerSummaryResponse>,totalCount: null == totalCount ? _self.totalCount : totalCount // ignore: cast_nullable_to_non_nullable
as int,pageNumber: null == pageNumber ? _self.pageNumber : pageNumber // ignore: cast_nullable_to_non_nullable
as int,pageSize: null == pageSize ? _self.pageSize : pageSize // ignore: cast_nullable_to_non_nullable
as int,totalPages: null == totalPages ? _self.totalPages : totalPages // ignore: cast_nullable_to_non_nullable
as int,hasPreviousPage: null == hasPreviousPage ? _self.hasPreviousPage : hasPreviousPage // ignore: cast_nullable_to_non_nullable
as bool,hasNextPage: null == hasNextPage ? _self.hasNextPage : hasNextPage // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
