// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mu_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Mu _$MuFromJson(Map<String, dynamic> json) {
  return _Mu.fromJson(json);
}

/// @nodoc
mixin _$Mu {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get description => throw _privateConstructorUsedError;
  String get profileImageUrl => throw _privateConstructorUsedError;
  String get bannerImageUrl => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get language => throw _privateConstructorUsedError;
  String get topicLevel1 => throw _privateConstructorUsedError;
  String get topicLevel2 => throw _privateConstructorUsedError;
  int get memberCount => throw _privateConstructorUsedError;
  int get postCount => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  String? get officialType =>
      throw _privateConstructorUsedError; // 정치인, 정당, 미디어, etc.
  String? get officialBadgeUrl =>
      throw _privateConstructorUsedError; // URL for badge icons (국회의원, 대통령, etc.)
  bool get isOfficial => throw _privateConstructorUsedError;
  bool get isVerified => throw _privateConstructorUsedError;

  /// Serializes this Mu to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Mu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MuCopyWith<Mu> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MuCopyWith<$Res> {
  factory $MuCopyWith(Mu value, $Res Function(Mu) then) =
      _$MuCopyWithImpl<$Res, Mu>;
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String profileImageUrl,
      String bannerImageUrl,
      String country,
      String language,
      String topicLevel1,
      String topicLevel2,
      int memberCount,
      int postCount,
      DateTime createdAt,
      String? officialType,
      String? officialBadgeUrl,
      bool isOfficial,
      bool isVerified});
}

/// @nodoc
class _$MuCopyWithImpl<$Res, $Val extends Mu> implements $MuCopyWith<$Res> {
  _$MuCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Mu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? profileImageUrl = null,
    Object? bannerImageUrl = null,
    Object? country = null,
    Object? language = null,
    Object? topicLevel1 = null,
    Object? topicLevel2 = null,
    Object? memberCount = null,
    Object? postCount = null,
    Object? createdAt = null,
    Object? officialType = freezed,
    Object? officialBadgeUrl = freezed,
    Object? isOfficial = null,
    Object? isVerified = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImageUrl: null == bannerImageUrl
          ? _value.bannerImageUrl
          : bannerImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      topicLevel1: null == topicLevel1
          ? _value.topicLevel1
          : topicLevel1 // ignore: cast_nullable_to_non_nullable
              as String,
      topicLevel2: null == topicLevel2
          ? _value.topicLevel2
          : topicLevel2 // ignore: cast_nullable_to_non_nullable
              as String,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      officialType: freezed == officialType
          ? _value.officialType
          : officialType // ignore: cast_nullable_to_non_nullable
              as String?,
      officialBadgeUrl: freezed == officialBadgeUrl
          ? _value.officialBadgeUrl
          : officialBadgeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MuImplCopyWith<$Res> implements $MuCopyWith<$Res> {
  factory _$$MuImplCopyWith(_$MuImpl value, $Res Function(_$MuImpl) then) =
      __$$MuImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String description,
      String profileImageUrl,
      String bannerImageUrl,
      String country,
      String language,
      String topicLevel1,
      String topicLevel2,
      int memberCount,
      int postCount,
      DateTime createdAt,
      String? officialType,
      String? officialBadgeUrl,
      bool isOfficial,
      bool isVerified});
}

/// @nodoc
class __$$MuImplCopyWithImpl<$Res> extends _$MuCopyWithImpl<$Res, _$MuImpl>
    implements _$$MuImplCopyWith<$Res> {
  __$$MuImplCopyWithImpl(_$MuImpl _value, $Res Function(_$MuImpl) _then)
      : super(_value, _then);

  /// Create a copy of Mu
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? description = null,
    Object? profileImageUrl = null,
    Object? bannerImageUrl = null,
    Object? country = null,
    Object? language = null,
    Object? topicLevel1 = null,
    Object? topicLevel2 = null,
    Object? memberCount = null,
    Object? postCount = null,
    Object? createdAt = null,
    Object? officialType = freezed,
    Object? officialBadgeUrl = freezed,
    Object? isOfficial = null,
    Object? isVerified = null,
  }) {
    return _then(_$MuImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      description: null == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String,
      profileImageUrl: null == profileImageUrl
          ? _value.profileImageUrl
          : profileImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      bannerImageUrl: null == bannerImageUrl
          ? _value.bannerImageUrl
          : bannerImageUrl // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      language: null == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String,
      topicLevel1: null == topicLevel1
          ? _value.topicLevel1
          : topicLevel1 // ignore: cast_nullable_to_non_nullable
              as String,
      topicLevel2: null == topicLevel2
          ? _value.topicLevel2
          : topicLevel2 // ignore: cast_nullable_to_non_nullable
              as String,
      memberCount: null == memberCount
          ? _value.memberCount
          : memberCount // ignore: cast_nullable_to_non_nullable
              as int,
      postCount: null == postCount
          ? _value.postCount
          : postCount // ignore: cast_nullable_to_non_nullable
              as int,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      officialType: freezed == officialType
          ? _value.officialType
          : officialType // ignore: cast_nullable_to_non_nullable
              as String?,
      officialBadgeUrl: freezed == officialBadgeUrl
          ? _value.officialBadgeUrl
          : officialBadgeUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      isVerified: null == isVerified
          ? _value.isVerified
          : isVerified // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MuImpl implements _Mu {
  const _$MuImpl(
      {required this.id,
      required this.name,
      required this.description,
      required this.profileImageUrl,
      required this.bannerImageUrl,
      required this.country,
      required this.language,
      required this.topicLevel1,
      required this.topicLevel2,
      required this.memberCount,
      required this.postCount,
      required this.createdAt,
      this.officialType,
      this.officialBadgeUrl,
      this.isOfficial = false,
      this.isVerified = false});

  factory _$MuImpl.fromJson(Map<String, dynamic> json) =>
      _$$MuImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String description;
  @override
  final String profileImageUrl;
  @override
  final String bannerImageUrl;
  @override
  final String country;
  @override
  final String language;
  @override
  final String topicLevel1;
  @override
  final String topicLevel2;
  @override
  final int memberCount;
  @override
  final int postCount;
  @override
  final DateTime createdAt;
  @override
  final String? officialType;
// 정치인, 정당, 미디어, etc.
  @override
  final String? officialBadgeUrl;
// URL for badge icons (국회의원, 대통령, etc.)
  @override
  @JsonKey()
  final bool isOfficial;
  @override
  @JsonKey()
  final bool isVerified;

  @override
  String toString() {
    return 'Mu(id: $id, name: $name, description: $description, profileImageUrl: $profileImageUrl, bannerImageUrl: $bannerImageUrl, country: $country, language: $language, topicLevel1: $topicLevel1, topicLevel2: $topicLevel2, memberCount: $memberCount, postCount: $postCount, createdAt: $createdAt, officialType: $officialType, officialBadgeUrl: $officialBadgeUrl, isOfficial: $isOfficial, isVerified: $isVerified)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MuImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.description, description) ||
                other.description == description) &&
            (identical(other.profileImageUrl, profileImageUrl) ||
                other.profileImageUrl == profileImageUrl) &&
            (identical(other.bannerImageUrl, bannerImageUrl) ||
                other.bannerImageUrl == bannerImageUrl) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.topicLevel1, topicLevel1) ||
                other.topicLevel1 == topicLevel1) &&
            (identical(other.topicLevel2, topicLevel2) ||
                other.topicLevel2 == topicLevel2) &&
            (identical(other.memberCount, memberCount) ||
                other.memberCount == memberCount) &&
            (identical(other.postCount, postCount) ||
                other.postCount == postCount) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.officialType, officialType) ||
                other.officialType == officialType) &&
            (identical(other.officialBadgeUrl, officialBadgeUrl) ||
                other.officialBadgeUrl == officialBadgeUrl) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.isVerified, isVerified) ||
                other.isVerified == isVerified));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      description,
      profileImageUrl,
      bannerImageUrl,
      country,
      language,
      topicLevel1,
      topicLevel2,
      memberCount,
      postCount,
      createdAt,
      officialType,
      officialBadgeUrl,
      isOfficial,
      isVerified);

  /// Create a copy of Mu
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MuImplCopyWith<_$MuImpl> get copyWith =>
      __$$MuImplCopyWithImpl<_$MuImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MuImplToJson(
      this,
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    // TODO: implement toFirestore
    throw UnimplementedError();
  }
}

abstract class _Mu implements Mu {
  const factory _Mu(
      {required final String id,
      required final String name,
      required final String description,
      required final String profileImageUrl,
      required final String bannerImageUrl,
      required final String country,
      required final String language,
      required final String topicLevel1,
      required final String topicLevel2,
      required final int memberCount,
      required final int postCount,
      required final DateTime createdAt,
      final String? officialType,
      final String? officialBadgeUrl,
      final bool isOfficial,
      final bool isVerified}) = _$MuImpl;

  factory _Mu.fromJson(Map<String, dynamic> json) = _$MuImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get description;
  @override
  String get profileImageUrl;
  @override
  String get bannerImageUrl;
  @override
  String get country;
  @override
  String get language;
  @override
  String get topicLevel1;
  @override
  String get topicLevel2;
  @override
  int get memberCount;
  @override
  int get postCount;
  @override
  DateTime get createdAt;
  @override
  String? get officialType; // 정치인, 정당, 미디어, etc.
  @override
  String? get officialBadgeUrl; // URL for badge icons (국회의원, 대통령, etc.)
  @override
  bool get isOfficial;
  @override
  bool get isVerified;

  /// Create a copy of Mu
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MuImplCopyWith<_$MuImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
