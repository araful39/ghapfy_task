class UserProfileModel {
  final String? status;
  final int? statusCode;
  final Data? data;
  final List<dynamic>? errors; // Dynamic because 'errors' can be strings, objects, etc.

  UserProfileModel({
    this.status,
    this.statusCode,
    this.data,
    this.errors,
  });

  factory UserProfileModel.fromJson(Map<String, dynamic> json) {
    return UserProfileModel(
      status: json['status'] as String?,
      statusCode: json['statusCode'] as int?,
      data: json['data'] != null ? Data.fromJson(json['data']) : null,
      errors: json['errors'] != null ? List<dynamic>.from(json['errors']) : null,
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
  final int? id;
  final String? createdAt;
  final String? updatedAt;
  final String? deletedAt; // Use String? or DateTime? if needed, not Null type
  final String? name;
  final String? email;
  final bool? isActive;
  final String? rank;
  final String? intro;
  final String? avatarUrl;
  final String? location;
  final List<Role>? roles;
  final int? totalFollwings;
  final int? totalFollowers;

  Data({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.name,
    this.email,
    this.isActive,
    this.rank,
    this.intro,
    this.avatarUrl,
    this.location,
    this.roles,
    this.totalFollwings,
    this.totalFollowers,
  });

  factory Data.fromJson(Map<String, dynamic> json) {
    return Data(
      id: json['id'] as int?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      deletedAt: json['deletedAt'] as String?,
      name: json['name'] as String?,
      email: json['email'] as String?,
      isActive: json['isActive'] as bool?,
      rank: json['rank'] as String?,
      intro: json['intro'] as String?,
      avatarUrl: json['avatarUrl'] as String?,
      location: json['location'] as String?,
      roles: json['roles'] != null
          ? (json['roles'] as List).map((e) => Role.fromJson(e)).toList()
          : null,
      totalFollwings: json['totalFollwings'] as int?,
      totalFollowers: json['totalFollowers'] as int?,
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
      'roles': roles?.map((e) => e.toJson()).toList(),
      'totalFollwings': totalFollwings,
      'totalFollowers': totalFollowers,
    };
  }
}

class Role {
  final int? id;
  final String? name;

  Role({
    this.id,
    this.name,
  });

  factory Role.fromJson(Map<String, dynamic> json) {
    return Role(
      id: json['id'] as int?,
      name: json['name'] as String?,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
    };
  }
}
