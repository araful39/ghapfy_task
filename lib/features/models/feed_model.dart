class FeedModel {
  String? status;
  int? statusCode;
  Data? data;
  List<dynamic>? errors;

  FeedModel({this.status, this.statusCode, this.data, this.errors});

  FeedModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    statusCode = json['statusCode'];
    data = json['data'] != null ? Data.fromJson(json['data']) : null;
    errors = json['errors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['status'] = status;
    data['statusCode'] = statusCode;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
    }
    if (errors != null) {
      data['errors'] = errors;
    }
    return data;
  }
}

class Data {
  List<Result>? result;
  int? total;

  Data({this.result, this.total});

  Data.fromJson(Map<String, dynamic> json) {
    if (json['result'] != null) {
      result = List<Result>.from(json['result'].map((x) => Result.fromJson(x)));
    }
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    if (result != null) {
      data['result'] = result!.map((v) => v.toJson()).toList();
    }
    data['total'] = total;
    return data;
  }
}

class Result {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? avgRating;
  dynamic parentPostId;
  int? viewCount;
  String? body;
  List<PostContents>? postContents;
  User? user;
  dynamic parentPost;
  dynamic loggedInUserRating;
  int? totalReactionCount;
  int? totalComment;
  int? totalShares;

  Result({
    this.id,
    this.createdAt,
    this.updatedAt,
    this.deletedAt,
    this.avgRating,
    this.parentPostId,
    this.viewCount,
    this.body,
    this.postContents,
    this.user,
    this.parentPost,
    this.loggedInUserRating,
    this.totalReactionCount,
    this.totalComment,
    this.totalShares,
  });

  Result.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    avgRating = json['avg_rating'];
    parentPostId = json['parentPostId'];
    viewCount = json['viewCount'];
    body = json['body'];
    if (json['postContents'] != null) {
      postContents = List<PostContents>.from(
          json['postContents'].map((x) => PostContents.fromJson(x)));
    }
    user = json['user'] != null ? User.fromJson(json['user']) : null;
    parentPost = json['parentPost'];
    loggedInUserRating = json['loggedInUserRating'];
    totalReactionCount = json['totalReactionCount'];
    totalComment = json['totalComment'];
    totalShares = json['totalShares'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['avg_rating'] = avgRating;
    data['parentPostId'] = parentPostId;
    data['viewCount'] = viewCount;
    data['body'] = body;
    if (postContents != null) {
      data['postContents'] = postContents!.map((v) => v.toJson()).toList();
    }
    if (user != null) {
      data['user'] = user!.toJson();
    }
    data['parentPost'] = parentPost;
    data['loggedInUserRating'] = loggedInUserRating;
    data['totalReactionCount'] = totalReactionCount;
    data['totalComment'] = totalComment;
    data['totalShares'] = totalShares;
    return data;
  }
}

class PostContents {
  String? type;
  String? contentUrl;

  PostContents({this.type, this.contentUrl});

  PostContents.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    contentUrl = json['contentUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['type'] = type;
    data['contentUrl'] = contentUrl;
    return data;
  }
}

class User {
  int? id;
  String? createdAt;
  String? updatedAt;
  dynamic deletedAt;
  String? name;
  String? email;
  bool? isActive;
  String? rank;
  String? intro;
  String? avatarUrl;
  String? location;

  User({
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
  });

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    deletedAt = json['deletedAt'];
    name = json['name'];
    email = json['email'];
    isActive = json['isActive'];
    rank = json['rank'];
    intro = json['intro'];
    avatarUrl = json['avatarUrl'];
    location = json['location'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {};
    data['id'] = id;
    data['createdAt'] = createdAt;
    data['updatedAt'] = updatedAt;
    data['deletedAt'] = deletedAt;
    data['name'] = name;
    data['email'] = email;
    data['isActive'] = isActive;
    data['rank'] = rank;
    data['intro'] = intro;
    data['avatarUrl'] = avatarUrl;
    data['location'] = location;
    return data;
  }
}
