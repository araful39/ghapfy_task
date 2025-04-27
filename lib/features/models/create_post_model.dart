class CreatePostModel {
  String? status;
  int? statusCode;
  PostData? data;
  List<dynamic>? errors;

  CreatePostModel({this.status, this.statusCode, this.data, this.errors});

  factory CreatePostModel.fromJson(Map<String, dynamic> json) {
    return CreatePostModel(
      status: json['status'],
      statusCode: json['statusCode'],
      data: json['data'] != null ? PostData.fromJson(json['data']) : null,
      errors: json['errors'],
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

class PostData {
  User? user;
  String? body;
  dynamic postContents; // since it's null now
  int? parentPostId;
  int? id;
  String? createdAt;
  String? updatedAt;
  String? deletedAt;
  String? avgRating;
  int? viewCount;

  PostData({
    this.user,
    this.body,
    this.postContents,
    this.parentPostId,
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.avgRating,
    this.viewCount,
  });

  factory PostData.fromJson(Map<String, dynamic> json) {
    return PostData(
      user: json['user'] != null ? User.fromJson(json['user']) : null,
      body: json['body'],
      postContents: json['postContents'],
      parentPostId: json['parentPostId'],
      id: json['id'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      deletedAt: json['deletedAt'],
      avgRating: json['avg_rating'],
      viewCount: json['viewCount'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'user': user?.toJson(),
      'body': body,
      'postContents': postContents,
      'parentPostId': parentPostId,
      'id': id,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'deletedAt': deletedAt,
      'avg_rating': avgRating,
      'viewCount': viewCount,
    };
  }
}

class User {
  int? id;
  String? name;
  String? email;
  String? rank;
  List<Role>? roles;

  User({this.id, this.name, this.email, this.rank, this.roles});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      name: json['name'],
      email: json['email'],
      rank: json['rank'],
      roles: json['roles'] != null
          ? (json['roles'] as List).map((e) => Role.fromJson(e)).toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'rank': rank,
      'roles': roles?.map((e) => e.toJson()).toList(),
    };
  }
}

class Role {
  String? name;
  List<Permission>? permissions;

  Role({this.name, this.permissions});

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      name: json['name'],
      permissions: json['permissions'] != null
          ? (json['permissions'] as List)
              .map((e) => Permission.fromJson(e))
              .toList()
          : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'permissions': permissions?.map((e) => e.toJson()).toList(),
    };
  }
}

class Permission {
  String? name;

  Permission({this.name});

  factory Permission.fromJson(Map<String, dynamic> json) {
    return Permission(
      name: json['name'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
    };
  }
}
