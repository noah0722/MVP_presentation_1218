// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'comment_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Comment _$CommentFromJson(Map<String, dynamic> json) {
  return _Comment.fromJson(json);
}

/// @nodoc
mixin _$Comment {
  String get id => throw _privateConstructorUsedError;
  String get postId => throw _privateConstructorUsedError;
  String get authorId => throw _privateConstructorUsedError;
  String get authorName => throw _privateConstructorUsedError;
  String get content => throw _privateConstructorUsedError;
  DateTime get createdAt => throw _privateConstructorUsedError;
  int get thumbsUp => throw _privateConstructorUsedError;
  int get thumbsDown => throw _privateConstructorUsedError;
  String? get parentId => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;
  List<String> get mentions => throw _privateConstructorUsedError;
  bool get isUserThumbUp => throw _privateConstructorUsedError;
  bool get isUserThumbDown => throw _privateConstructorUsedError;

  /// Serializes this Comment to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $CommentCopyWith<Comment> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CommentCopyWith<$Res> {
  factory $CommentCopyWith(Comment value, $Res Function(Comment) then) =
      _$CommentCopyWithImpl<$Res, Comment>;
  @useResult
  $Res call(
      {String id,
      String postId,
      String authorId,
      String authorName,
      String content,
      DateTime createdAt,
      int thumbsUp,
      int thumbsDown,
      String? parentId,
      int level,
      List<String> mentions,
      bool isUserThumbUp,
      bool isUserThumbDown});
}

/// @nodoc
class _$CommentCopyWithImpl<$Res, $Val extends Comment>
    implements $CommentCopyWith<$Res> {
  _$CommentCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? content = null,
    Object? createdAt = null,
    Object? thumbsUp = null,
    Object? thumbsDown = null,
    Object? parentId = freezed,
    Object? level = null,
    Object? mentions = null,
    Object? isUserThumbUp = null,
    Object? isUserThumbDown = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
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
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      mentions: null == mentions
          ? _value.mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
abstract class _$$CommentImplCopyWith<$Res> implements $CommentCopyWith<$Res> {
  factory _$$CommentImplCopyWith(
          _$CommentImpl value, $Res Function(_$CommentImpl) then) =
      __$$CommentImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String postId,
      String authorId,
      String authorName,
      String content,
      DateTime createdAt,
      int thumbsUp,
      int thumbsDown,
      String? parentId,
      int level,
      List<String> mentions,
      bool isUserThumbUp,
      bool isUserThumbDown});
}

/// @nodoc
class __$$CommentImplCopyWithImpl<$Res>
    extends _$CommentCopyWithImpl<$Res, _$CommentImpl>
    implements _$$CommentImplCopyWith<$Res> {
  __$$CommentImplCopyWithImpl(
      _$CommentImpl _value, $Res Function(_$CommentImpl) _then)
      : super(_value, _then);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? postId = null,
    Object? authorId = null,
    Object? authorName = null,
    Object? content = null,
    Object? createdAt = null,
    Object? thumbsUp = null,
    Object? thumbsDown = null,
    Object? parentId = freezed,
    Object? level = null,
    Object? mentions = null,
    Object? isUserThumbUp = null,
    Object? isUserThumbDown = null,
  }) {
    return _then(_$CommentImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      postId: null == postId
          ? _value.postId
          : postId // ignore: cast_nullable_to_non_nullable
              as String,
      authorId: null == authorId
          ? _value.authorId
          : authorId // ignore: cast_nullable_to_non_nullable
              as String,
      authorName: null == authorName
          ? _value.authorName
          : authorName // ignore: cast_nullable_to_non_nullable
              as String,
      content: null == content
          ? _value.content
          : content // ignore: cast_nullable_to_non_nullable
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
      parentId: freezed == parentId
          ? _value.parentId
          : parentId // ignore: cast_nullable_to_non_nullable
              as String?,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
      mentions: null == mentions
          ? _value._mentions
          : mentions // ignore: cast_nullable_to_non_nullable
              as List<String>,
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
class _$CommentImpl implements _Comment {
  const _$CommentImpl(
      {required this.id,
      required this.postId,
      required this.authorId,
      required this.authorName,
      required this.content,
      required this.createdAt,
      required this.thumbsUp,
      required this.thumbsDown,
      this.parentId,
      required this.level,
      final List<String> mentions = const [],
      this.isUserThumbUp = false,
      this.isUserThumbDown = false})
      : _mentions = mentions;

  factory _$CommentImpl.fromJson(Map<String, dynamic> json) =>
      _$$CommentImplFromJson(json);

  @override
  final String id;
  @override
  final String postId;
  @override
  final String authorId;
  @override
  final String authorName;
  @override
  final String content;
  @override
  final DateTime createdAt;
  @override
  final int thumbsUp;
  @override
  final int thumbsDown;
  @override
  final String? parentId;
  @override
  final int level;
  final List<String> _mentions;
  @override
  @JsonKey()
  List<String> get mentions {
    if (_mentions is EqualUnmodifiableListView) return _mentions;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_mentions);
  }

  @override
  @JsonKey()
  final bool isUserThumbUp;
  @override
  @JsonKey()
  final bool isUserThumbDown;

  @override
  String toString() {
    return 'Comment(id: $id, postId: $postId, authorId: $authorId, authorName: $authorName, content: $content, createdAt: $createdAt, thumbsUp: $thumbsUp, thumbsDown: $thumbsDown, parentId: $parentId, level: $level, mentions: $mentions, isUserThumbUp: $isUserThumbUp, isUserThumbDown: $isUserThumbDown)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CommentImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.postId, postId) || other.postId == postId) &&
            (identical(other.authorId, authorId) ||
                other.authorId == authorId) &&
            (identical(other.authorName, authorName) ||
                other.authorName == authorName) &&
            (identical(other.content, content) || other.content == content) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.thumbsUp, thumbsUp) ||
                other.thumbsUp == thumbsUp) &&
            (identical(other.thumbsDown, thumbsDown) ||
                other.thumbsDown == thumbsDown) &&
            (identical(other.parentId, parentId) ||
                other.parentId == parentId) &&
            (identical(other.level, level) || other.level == level) &&
            const DeepCollectionEquality().equals(other._mentions, _mentions) &&
            (identical(other.isUserThumbUp, isUserThumbUp) ||
                other.isUserThumbUp == isUserThumbUp) &&
            (identical(other.isUserThumbDown, isUserThumbDown) ||
                other.isUserThumbDown == isUserThumbDown));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      postId,
      authorId,
      authorName,
      content,
      createdAt,
      thumbsUp,
      thumbsDown,
      parentId,
      level,
      const DeepCollectionEquality().hash(_mentions),
      isUserThumbUp,
      isUserThumbDown);

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      __$$CommentImplCopyWithImpl<_$CommentImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CommentImplToJson(
      this,
    );
  }

  @override
  Map<String, dynamic> toFirestore() {
    // TODO: implement toFirestore
    throw UnimplementedError();
  }
}

abstract class _Comment implements Comment {
  const factory _Comment(
      {required final String id,
      required final String postId,
      required final String authorId,
      required final String authorName,
      required final String content,
      required final DateTime createdAt,
      required final int thumbsUp,
      required final int thumbsDown,
      final String? parentId,
      required final int level,
      final List<String> mentions,
      final bool isUserThumbUp,
      final bool isUserThumbDown}) = _$CommentImpl;

  factory _Comment.fromJson(Map<String, dynamic> json) = _$CommentImpl.fromJson;

  @override
  String get id;
  @override
  String get postId;
  @override
  String get authorId;
  @override
  String get authorName;
  @override
  String get content;
  @override
  DateTime get createdAt;
  @override
  int get thumbsUp;
  @override
  int get thumbsDown;
  @override
  String? get parentId;
  @override
  int get level;
  @override
  List<String> get mentions;
  @override
  bool get isUserThumbUp;
  @override
  bool get isUserThumbDown;

  /// Create a copy of Comment
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$CommentImplCopyWith<_$CommentImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
