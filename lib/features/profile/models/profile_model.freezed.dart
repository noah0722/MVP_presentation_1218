// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Profile _$ProfileFromJson(Map<String, dynamic> json) {
  return _Profile.fromJson(json);
}

/// @nodoc
mixin _$Profile {
  String get id => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get displayName => throw _privateConstructorUsedError;
  int get commorePoints => throw _privateConstructorUsedError;
  int get postCount => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  DateTime get lastLoginAt => throw _privateConstructorUsedError;
  bool get isAdmin => throw _privateConstructorUsedError;

  /// Serializes this Profile to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ProfileCopyWith<Profile> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ProfileCopyWith<$Res> {
  factory $ProfileCopyWith(Profile value, $Res Function(Profile) then) =
      _$ProfileCopyWithImpl<$Res, Profile>;
  @useResult
  $Res call(
      {String id,
      String email,
      String displayName,
      int commorePoints,
      int postCount,
      int commentCount,
      DateTime createdAt,
      DateTime lastLoginAt,
      bool isAdmin});
}

/// @nodoc
class _$ProfileCopyWithImpl<$Res, $Val extends Profile>
    implements $ProfileCopyWith<$Res> {
  _$ProfileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? commorePoints = null,
    Object? postCount = null,
    Object? commentCount = null,
    Object? createdAt = null,
    Object? lastLoginAt = null,
    Object? isAdmin = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      commorePoints: null == commorePoints
          ? _value.commorePoints
          : commorePoints // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLoginAt: null == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ProfileImplCopyWith<$Res> implements $ProfileCopyWith<$Res> {
  factory _$$ProfileImplCopyWith(
          _$ProfileImpl value, $Res Function(_$ProfileImpl) then) =
      __$$ProfileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String email,
      String displayName,
      int commorePoints,
      int postCount,
      int commentCount,
      DateTime createdAt,
      DateTime lastLoginAt,
      bool isAdmin});
}

/// @nodoc
class __$$ProfileImplCopyWithImpl<$Res>
    extends _$ProfileCopyWithImpl<$Res, _$ProfileImpl>
    implements _$$ProfileImplCopyWith<$Res> {
  __$$ProfileImplCopyWithImpl(
      _$ProfileImpl _value, $Res Function(_$ProfileImpl) _then)
      : super(_value, _then);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? email = null,
    Object? displayName = null,
    Object? commorePoints = null,
    Object? postCount = null,
    Object? commentCount = null,
    Object? createdAt = null,
    Object? lastLoginAt = null,
    Object? isAdmin = null,
  }) {
    return _then(_$ProfileImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      displayName: null == displayName
          ? _value.displayName
          : displayName // ignore: cast_nullable_to_non_nullable
              as String,
      commorePoints: null == commorePoints
          ? _value.commorePoints
          : commorePoints // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      lastLoginAt: null == lastLoginAt
          ? _value.lastLoginAt
          : lastLoginAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      isAdmin: null == isAdmin
          ? _value.isAdmin
          : isAdmin // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ProfileImpl extends _Profile {
  _$ProfileImpl(
      {required this.id,
      required this.email,
      required this.displayName,
      required this.commorePoints,
      required this.postCount,
      required this.commentCount,
      required this.createdAt,
      required this.lastLoginAt,
      this.isAdmin = false})
      : super._();

  factory _$ProfileImpl.fromJson(Map<String, dynamic> json) =>
      _$$ProfileImplFromJson(json);

  @override
  final String id;
  @override
  final String email;
  @override
  final String displayName;
  @override
  final int commorePoints;
  @override
  final int postCount;
  @override
  final int commentCount;
  @override
  final DateTime createdAt;
  @override
  final DateTime lastLoginAt;
  @override
  @JsonKey()
  final bool isAdmin;

  @override
  String toString() {
    return 'Profile(id: $id, email: $email, displayName: $displayName, commorePoints: $commorePoints, postCount: $postCount, commentCount: $commentCount, createdAt: $createdAt, lastLoginAt: $lastLoginAt, isAdmin: $isAdmin)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ProfileImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.displayName, displayName) ||
                other.displayName == displayName) &&
            (identical(other.commorePoints, commorePoints) ||
                other.commorePoints == commorePoints) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.lastLoginAt, lastLoginAt) ||
                other.lastLoginAt == lastLoginAt) &&
            (identical(other.isAdmin, isAdmin) || other.isAdmin == isAdmin));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, email, displayName,
      commorePoints, postCount, commentCount, createdAt, lastLoginAt, isAdmin);

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      __$$ProfileImplCopyWithImpl<_$ProfileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ProfileImplToJson(
      this,
    );
  }
}

abstract class _Profile extends Profile {
  factory _Profile(
      {required final String id,
      required final String email,
      required final String displayName,
      required final int commorePoints,
      required final int postCount,
      required final int commentCount,
      required final DateTime createdAt,
      required final DateTime lastLoginAt,
      final bool isAdmin}) = _$ProfileImpl;
  _Profile._() : super._();

  factory _Profile.fromJson(Map<String, dynamic> json) = _$ProfileImpl.fromJson;

  @override
  String get id;
  @override
  String get email;
  @override
  String get displayName;
  @override
  int get commorePoints;
  @override
  int get postCount;
  @override
  int get commentCount;
  @override
  DateTime get createdAt;
  @override
  DateTime get lastLoginAt;
  @override
  bool get isAdmin;

  /// Create a copy of Profile
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ProfileImplCopyWith<_$ProfileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

CommoreTransaction _$CommoreTransactionFromJson(Map<String, dynamic> json) {
  return _CommoreTransaction.fromJson(json);
}

/// @nodoc
mixin _$CommoreTransaction {
  String get id => throw _privateConstructorUsedError;
  String get userId => throw _privateConstructorUsedError;
  int get points => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get timestamp => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;

  /// Serializes this CommoreTransaction to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of CommoreTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommoreTransactionCopyWith<CommoreTransaction> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommoreTransactionCopyWith<$Res> {
  factory $CommoreTransactionCopyWith(
          CommoreTransaction value, $Res Function(CommoreTransaction) then) =
      _$CommoreTransactionCopyWithImpl<$Res, CommoreTransaction>;
  @useResult
  $Res call(
      {String id,
      String userId,
      int points,
      String type,
      DateTime timestamp,
      String? description});
}

/// @nodoc
class _$CommoreTransactionCopyWithImpl<$Res, $Val extends CommoreTransaction>
    implements $CommoreTransactionCopyWith<$Res> {
  _$CommoreTransactionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of CommoreTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? points = null,
    Object? type = null,
    Object? timestamp = null,
    Object? description = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CommoreTransactionImplCopyWith<$Res>
    implements $CommoreTransactionCopyWith<$Res> {
  factory _$$CommoreTransactionImplCopyWith(_$CommoreTransactionImpl value,
          $Res Function(_$CommoreTransactionImpl) then) =
      __$$CommoreTransactionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String userId,
      int points,
      String type,
      DateTime timestamp,
      String? description});
}

/// @nodoc
class __$$CommoreTransactionImplCopyWithImpl<$Res>
    extends _$CommoreTransactionCopyWithImpl<$Res, _$CommoreTransactionImpl>
    implements _$$CommoreTransactionImplCopyWith<$Res> {
  __$$CommoreTransactionImplCopyWithImpl(_$CommoreTransactionImpl _value,
      $Res Function(_$CommoreTransactionImpl) _then)
      : super(_value, _then);

  /// Create a copy of CommoreTransaction
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = null,
    Object? points = null,
    Object? type = null,
    Object? timestamp = null,
    Object? description = freezed,
  }) {
    return _then(_$CommoreTransactionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: null == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String,
      points: null == points
          ? _value.points
          : points // ignore: cast_nullable_to_non_nullable
              as int,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      timestamp: null == timestamp
          ? _value.timestamp
          : timestamp // ignore: cast_nullable_to_non_nullable
              as DateTime,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CommoreTransactionImpl implements _CommoreTransaction {
  const _$CommoreTransactionImpl(
      {required this.id,
      required this.userId,
      required this.points,
      required this.type,
      required this.timestamp,
      this.description});

  factory _$CommoreTransactionImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommoreTransactionImplFromJson(json);

  @override
  final String id;
  @override
  final String userId;
  @override
  final int points;
  @override
  final String type;
  @override
  final DateTime timestamp;
  @override
  final String? description;

  @override
  String toString() {
    return 'CommoreTransaction(id: $id, userId: $userId, points: $points, type: $type, timestamp: $timestamp, description: $description)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommoreTransactionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.points, points) || other.points == points) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.timestamp, timestamp) ||
                other.timestamp == timestamp) &&
            (identical(other.description, description) ||
                other.description == description));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, userId, points, type, timestamp, description);

  /// Create a copy of CommoreTransaction
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommoreTransactionImplCopyWith<_$CommoreTransactionImpl> get copyWith =>
      __$$CommoreTransactionImplCopyWithImpl<_$CommoreTransactionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommoreTransactionImplToJson(
      this,
    );
  }
}

abstract class _CommoreTransaction implements CommoreTransaction {
  const factory _CommoreTransaction(
      {required final String id,
      required final String userId,
      required final int points,
      required final String type,
      required final DateTime timestamp,
      final String? description}) = _$CommoreTransactionImpl;

  factory _CommoreTransaction.fromJson(Map<String, dynamic> json) =
      _$CommoreTransactionImpl.fromJson;

  @override
  String get id;
  @override
  String get userId;
  @override
  int get points;
  @override
  String get type;
  @override
  DateTime get timestamp;
  @override
  String? get description;

  /// Create a copy of CommoreTransaction
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommoreTransactionImplCopyWith<_$CommoreTransactionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
