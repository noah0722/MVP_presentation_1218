// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'post_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Post _$PostFromJson(Map<String, dynamic> json) {
  return _Post.fromJson(json);
}

/// @nodoc
mixin _$Post {
  String get id => throw _privateConstructorUsedError;
  String get muId => throw _privateConstructorUsedError;
  String get muName => throw _privateConstructorUsedError;
  String get muProfileImage => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get thumbsUp => throw _privateConstructorUsedError;
  int get thumbsDown => throw _privateConstructorUsedError;
  int get commentCount => throw _privateConstructorUsedError;
  bool get isOfficial => throw _privateConstructorUsedError;
  String? get authorId => throw _privateConstructorUsedError;
  String? get authorName => throw _privateConstructorUsedError;
  List<String>? get images => throw _privateConstructorUsedError;
  String? get videoUrl => throw _privateConstructorUsedError;
  String? get linkUrl => throw _privateConstructorUsedError;
  String? get linkPreview => throw _privateConstructorUsedError;
  Map<String, dynamic>? get pollData => throw _privateConstructorUsedError;
  bool get isUserThumbUp => throw _privateConstructorUsedError;
  bool get isUserThumbDown => throw _privateConstructorUsedError;

  /// Serializes this Post to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $PostCopyWith<Post> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PostCopyWith<$Res> {
  factory $PostCopyWith(Post value, $Res Function(Post) then) =
      _$PostCopyWithImpl<$Res, Post>;
  @useResult
  $Res call(
      {String id,
      String muId,
      String muName,
      String muProfileImage,
      String title,
      String content,
      String type,
      DateTime createdAt,
      int thumbsUp,
      int thumbsDown,
      int commentCount,
      bool isOfficial,
      String? authorId,
      String? authorName,
      List<String>? images,
      String? videoUrl,
      String? linkUrl,
      String? linkPreview,
      Map<String, dynamic>? pollData,
      bool isUserThumbUp,
      bool isUserThumbDown});
}

/// @nodoc
class _$PostCopyWithImpl<$Res, $Val extends Post>
    implements $PostCopyWith<$Res> {
  _$PostCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? muId = null,
    Object? muName = null,
    Object? muProfileImage = null,
    Object? title = null,
    Object? content = null,
    Object? type = null,
    Object? createdAt = null,
    Object? thumbsUp = null,
    Object? thumbsDown = null,
    Object? commentCount = null,
    Object? isOfficial = null,
    Object? authorId = freezed,
    Object? authorName = freezed,
    Object? images = freezed,
    Object? videoUrl = freezed,
    Object? linkUrl = freezed,
    Object? linkPreview = freezed,
    Object? pollData = freezed,
    Object? isUserThumbUp = null,
    Object? isUserThumbDown = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      muId: null == muId
          ? _value.muId
          : muId // ignore: cast_nullable_to_non_nullable
              as String,
      muName: null == muName
          ? _value.muName
          : muName // ignore: cast_nullable_to_non_nullable
              as String,
      muProfileImage: null == muProfileImage
          ? _value.muProfileImage
          : muProfileImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      thumbsUp: null == thumbsUp
          ? _value.thumbsUp
          : thumbsUp // ignore: cast_nullable_to_non_nullable
              as int,
      thumbsDown: null == thumbsDown
          ? _value.thumbsDown
          : thumbsDown // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value.images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkUrl: freezed == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkPreview: freezed == linkPreview
          ? _value.linkPreview
          : linkPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      pollData: freezed == pollData
          ? _value.pollData
          : pollData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isUserThumbUp: null == isUserThumbUp
          ? _value.isUserThumbUp
          : isUserThumbUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserThumbDown: null == isUserThumbDown
          ? _value.isUserThumbDown
          : isUserThumbDown // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PostImplCopyWith<$Res> implements $PostCopyWith<$Res> {
  factory _$$PostImplCopyWith(
          _$PostImpl value, $Res Function(_$PostImpl) then) =
      __$$PostImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String muId,
      String muName,
      String muProfileImage,
      String title,
      String content,
      String type,
      DateTime createdAt,
      int thumbsUp,
      int thumbsDown,
      int commentCount,
      bool isOfficial,
      String? authorId,
      String? authorName,
      List<String>? images,
      String? videoUrl,
      String? linkUrl,
      String? linkPreview,
      Map<String, dynamic>? pollData,
      bool isUserThumbUp,
      bool isUserThumbDown});
}

/// @nodoc
class __$$PostImplCopyWithImpl<$Res>
    extends _$PostCopyWithImpl<$Res, _$PostImpl>
    implements _$$PostImplCopyWith<$Res> {
  __$$PostImplCopyWithImpl(_$PostImpl _value, $Res Function(_$PostImpl) _then)
      : super(_value, _then);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? muId = null,
    Object? muName = null,
    Object? muProfileImage = null,
    Object? title = null,
    Object? content = null,
    Object? type = null,
    Object? createdAt = null,
    Object? thumbsUp = null,
    Object? thumbsDown = null,
    Object? commentCount = null,
    Object? isOfficial = null,
    Object? authorId = freezed,
    Object? authorName = freezed,
    Object? images = freezed,
    Object? videoUrl = freezed,
    Object? linkUrl = freezed,
    Object? linkPreview = freezed,
    Object? pollData = freezed,
    Object? isUserThumbUp = null,
    Object? isUserThumbDown = null,
  }) {
    return _then(_$PostImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      muId: null == muId
          ? _value.muId
          : muId // ignore: cast_nullable_to_non_nullable
              as String,
      muName: null == muName
          ? _value.muName
          : muName // ignore: cast_nullable_to_non_nullable
              as String,
      muProfileImage: null == muProfileImage
          ? _value.muProfileImage
          : muProfileImage // ignore: cast_nullable_to_non_nullable
              as String,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as DateTime,
      thumbsUp: null == thumbsUp
          ? _value.thumbsUp
          : thumbsUp // ignore: cast_nullable_to_non_nullable
              as int,
      thumbsDown: null == thumbsDown
          ? _value.thumbsDown
          : thumbsDown // ignore: cast_nullable_to_non_nullable
              as int,
      commentCount: null == commentCount
          ? _value.commentCount
          : commentCount // ignore: cast_nullable_to_non_nullable
              as int,
      isOfficial: null == isOfficial
          ? _value.isOfficial
          : isOfficial // ignore: cast_nullable_to_non_nullable
              as bool,
      authorId: freezed == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String?,
      authorName: freezed == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String?,
      images: freezed == images
          ? _value._images
          : images // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      videoUrl: freezed == videoUrl
          ? _value.videoUrl
          : videoUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkUrl: freezed == linkUrl
          ? _value.linkUrl
          : linkUrl // ignore: cast_nullable_to_non_nullable
              as String?,
      linkPreview: freezed == linkPreview
          ? _value.linkPreview
          : linkPreview // ignore: cast_nullable_to_non_nullable
              as String?,
      pollData: freezed == pollData
          ? _value._pollData
          : pollData // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      isUserThumbUp: null == isUserThumbUp
          ? _value.isUserThumbUp
          : isUserThumbUp // ignore: cast_nullable_to_non_nullable
              as bool,
      isUserThumbDown: null == isUserThumbDown
          ? _value.isUserThumbDown
          : isUserThumbDown // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PostImpl extends _Post {
  const _$PostImpl(
      {required this.id,
      required this.muId,
      required this.muName,
      required this.muProfileImage,
      required this.title,
      required this.content,
      required this.type,
      required this.createdAt,
      required this.thumbsUp,
      required this.thumbsDown,
      required this.commentCount,
      required this.isOfficial,
      this.authorId,
      this.authorName,
      final List<String>? images,
      this.videoUrl,
      this.linkUrl,
      this.linkPreview,
      final Map<String, dynamic>? pollData,
      this.isUserThumbUp = false,
      this.isUserThumbDown = false})
      : _images = images,
        _pollData = pollData,
        super._();

  factory _$PostImpl.fromJson(Map<String, dynamic> json) =>
      _$$PostImplFromJson(json);

  @override
  final String id;
  @override
  final String muId;
  @override
  final String muName;
  @override
  final String muProfileImage;
  @override
  final String title;
  @override
  final String content;
  @override
  final String type;
  @override
  final DateTime createdAt;
  @override
  final int thumbsUp;
  @override
  final int thumbsDown;
  @override
  final int commentCount;
  @override
  final bool isOfficial;
  @override
  final String? authorId;
  @override
  final String? authorName;
  final List<String>? _images;
  @override
  List<String>? get images {
    final value = _images;
    if (value == null) return null;
    if (_images is EqualUnmodifiableListView) return _images;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final String? videoUrl;
  @override
  final String? linkUrl;
  @override
  final String? linkPreview;
  final Map<String, dynamic>? _pollData;
  @override
  Map<String, dynamic>? get pollData {
    final value = _pollData;
    if (value == null) return null;
    if (_pollData is EqualUnmodifiableMapView) return _pollData;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  @JsonKey()
  final bool isUserThumbUp;
  @override
  @JsonKey()
  final bool isUserThumbDown;

  @override
  String toString() {
    return 'Post(id: $id, muId: $muId, muName: $muName, muProfileImage: $muProfileImage, title: $title, content: $content, type: $type, createdAt: $createdAt, thumbsUp: $thumbsUp, thumbsDown: $thumbsDown, commentCount: $commentCount, isOfficial: $isOfficial, authorId: $authorId, authorName: $authorName, images: $images, videoUrl: $videoUrl, linkUrl: $linkUrl, linkPreview: $linkPreview, pollData: $pollData, isUserThumbUp: $isUserThumbUp, isUserThumbDown: $isUserThumbDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PostImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.muId, muId) || other.muId == muId) &&
            (identical(other.muName, muName) || other.muName == muName) &&
            (identical(other.muProfileImage, muProfileImage) ||
                other.muProfileImage == muProfileImage) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.thumbsUp, thumbsUp) ||
                other.thumbsUp == thumbsUp) &&
            (identical(other.thumbsDown, thumbsDown) ||
                other.thumbsDown == thumbsDown) &&
            (identical(other.commentCount, commentCount) ||
                other.commentCount == commentCount) &&
            (identical(other.isOfficial, isOfficial) ||
                other.isOfficial == isOfficial) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            const DeepCollectionEquality().equals(other._images, _images) &&
            (identical(other.videoUrl, videoUrl) ||
                other.videoUrl == videoUrl) &&
            (identical(other.linkUrl, linkUrl) || other.linkUrl == linkUrl) &&
            (identical(other.linkPreview, linkPreview) ||
                other.linkPreview == linkPreview) &&
            const DeepCollectionEquality().equals(other._pollData, _pollData) &&
            (identical(other.isUserThumbUp, isUserThumbUp) ||
                other.isUserThumbUp == isUserThumbUp) &&
            (identical(other.isUserThumbDown, isUserThumbDown) ||
                other.isUserThumbDown == isUserThumbDown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        muId,
        muName,
        muProfileImage,
        title,
        content,
        type,
        createdAt,
        thumbsUp,
        thumbsDown,
        commentCount,
        isOfficial,
        authorId,
        authorName,
        const DeepCollectionEquality().hash(_images),
        videoUrl,
        linkUrl,
        linkPreview,
        const DeepCollectionEquality().hash(_pollData),
        isUserThumbUp,
        isUserThumbDown
      ]);

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      __$$PostImplCopyWithImpl<_$PostImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PostImplToJson(
      this,
    );
  }
}

abstract class _Post extends Post {
  const factory _Post(
      {required final String id,
      required final String muId,
      required final String muName,
      required final String muProfileImage,
      required final String title,
      required final String content,
      required final String type,
      required final DateTime createdAt,
      required final int thumbsUp,
      required final int thumbsDown,
      required final int commentCount,
      required final bool isOfficial,
      final String? authorId,
      final String? authorName,
      final List<String>? images,
      final String? videoUrl,
      final String? linkUrl,
      final String? linkPreview,
      final Map<String, dynamic>? pollData,
      final bool isUserThumbUp,
      final bool isUserThumbDown}) = _$PostImpl;
  const _Post._() : super._();

  factory _Post.fromJson(Map<String, dynamic> json) = _$PostImpl.fromJson;

  @override
  String get id;
  @override
  String get muId;
  @override
  String get muName;
  @override
  String get muProfileImage;
  @override
  String get title;
  @override
  String get content;
  @override
  String get type;
  @override
  DateTime get createdAt;
  @override
  int get thumbsUp;
  @override
  int get thumbsDown;
  @override
  int get commentCount;
  @override
  bool get isOfficial;
  @override
  String? get authorId;
  @override
  String? get authorName;
  @override
  List<String>? get images;
  @override
  String? get videoUrl;
  @override
  String? get linkUrl;
  @override
  String? get linkPreview;
  @override
  Map<String, dynamic>? get pollData;
  @override
  bool get isUserThumbUp;
  @override
  bool get isUserThumbDown;

  /// Create a copy of Post
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$PostImplCopyWith<_$PostImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
