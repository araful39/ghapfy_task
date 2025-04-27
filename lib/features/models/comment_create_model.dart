class CommentCreateModel {
  final String status;
  final int statusCode;
  final Data? data;
  final List<dynamic> errors; // Changed from List<Null>

  CommentCreateModel({
    required this.status,
    required this.statusCode,
    this.data,
    this.errors = const [],
  });

  factory CommentCreateModel.fromJson(Map<String, dynamic> json) {
    return CommentCreateModel(
      status: json['status'] as String,
      statusCode: json['statusCode'] as int,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      errors: json['errors'] != null ? List<dynamic>.from(json['errors']) : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'status': status,
      'statusCode': statusCode,
      'data': data?.toJson(),
      'errors': errors,
    };
  }
}

class Data {
  final bool isSuccess;
  final bool isFailure;
  final Error? error;
  final Value? vValue;

  Data({
    required this.isSuccess,
    required this.isFailure,
    this.error,
    this.vValue,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      isSuccess: json['isSuccess'] as bool,
      isFailure: json['isFailure'] as bool,
      error: json['error'] != null ? Error.fromJson(json['error']) : null,
      vValue: json['_value'] != null ? Value.fromJson(json['_value']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'isSuccess': isSuccess,
      'isFailure': isFailure,
      'error': error?.toJson(),
      '_value': vValue?.toJson(),
    };
  }
}

class Error {
  final int code;

  Error({required this.code});

  factory Error.fromJson(Map<String, dynamic> json) {
    return Error(code: json['code'] as int);
  }

  Map<String, dynamic> toJson() {
    return {'code': code};
  }
}

class Value {
  final int id;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt; // Changed from Null
  final String body;
  final bool isReply;
  final dynamic commentContents; // Changed from Null
  final User user;
  final Post post;
  final List<dynamic> reactions; // Changed from List<Null>
  final List<dynamic> mentions; // Changed from List<Null>
  final List<dynamic> replies; // Changed from List<Null>

  Value({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.body,
    required this.isReply,
    this.commentContents,
    required this.user,
    required this.post,
    this.reactions = const [],
    this.mentions = const [],
    this.replies = const [],
  });

  factory Value.fromJson(Map<String, dynamic> json) {
    return Value(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'],
      body: json['body'] as String,
      isReply: json['isReply'] as bool,
      commentContents: json['commentContents'],
      user: User.fromJson(json['user']),
      post: Post.fromJson(json['post']),
      reactions: json['reactions'] != null 
          ? List<dynamic>.from(json['reactions']) 
          : [],
      mentions: json['mentions'] != null 
          ? List<dynamic>.from(json['mentions']) 
          : [],
      replies: json['replies'] != null 
          ? List<dynamic>.from(json['replies']) 
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'body': body,
      'isReply': isReply,
      'commentContents': commentContents,
      'user': user.toJson(),
      'post': post.toJson(),
      'reactions': reactions,
      'mentions': mentions,
      'replies': replies,
    };
  }
}

class User {
  final int id;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt; // Changed from Null
  final String name;
  final String email;
  final bool isActive;
  final String rank;
  final String intro;
  final String avatarUrl;
  final String location;

  User({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.name,
    required this.email,
    required this.isActive,
    required this.rank,
    required this.intro,
    required this.avatarUrl,
    required this.location,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'],
      name: json['name'] as String,
      email: json['email'] as String,
      isActive: json['isActive'] as bool,
      rank: json['rank'] as String,
      intro: json['intro'] as String,
      avatarUrl: json['avatarUrl'] as String,
      location: json['location'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'name': name,
      'email': email,
      'isActive': isActive,
      'rank': rank,
      'intro': intro,
      'avatarUrl': avatarUrl,
      'location': location,
    };
  }
}

class Post {
  final int id;
  final String createdAt;
  final String updatedAt;
  final dynamic deletedAt; // Changed from Null
  final String avgRating;
  final dynamic parentPostId; // Changed from Null
  final int viewCount;
  final String body;
  final dynamic postContents; // Changed from Null
  final User user;

  Post({
    required this.id,
    required this.createdAt,
    required this.updatedAt,
    this.deletedAt,
    required this.avgRating,
    this.parentPostId,
    required this.viewCount,
    required this.body,
    this.postContents,
    required this.user,
  });

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'] as int,
      createdAt: json['createdAt'] as String,
      updatedAt: json['updatedAt'] as String,
      deletedAt: json['deletedAt'],
      avgRating: json['avg_rating'] as String,
      parentPostId: json['parentPostId'],
      viewCount: json['viewCount'] as int,
      body: json['body'] as String,
      postContents: json['postContents'],
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'avg_rating': avgRating,
      'parentPostId': parentPostId,
      'viewCount': viewCount,
      'body': body,
      'postContents': postContents,
      'user': user.toJson(),
    };
  }
}