import 'comment_model.dart';


class PostModel {
  final String id;
  final String author;
  final String content;
  final String ownerId;
  final List<CommentModel> comments;
  int likes;
  final List<Attachment> attachments;

  PostModel({
    required this.id,
    required this.author,
    required this.content,
    required this.ownerId,
    required this.comments,
    this.likes = 0,
    this.attachments = const [],
  });
}

class Attachment {
  final String url;
  final String type; // VIDEO, IMAGE, FILE

  Attachment({
    required this.url,
    required this.type,
  });
}
