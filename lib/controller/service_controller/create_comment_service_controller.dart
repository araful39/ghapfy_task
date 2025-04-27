import 'dart:convert';
import 'package:ghapfy_team_app/features/models/comment_create_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class CreateCommentService {
  static final CreateCommentService _instance = CreateCommentService._internal();

  factory CreateCommentService() => _instance;

  CreateCommentService._internal();

  final String _baseUrl = 'https://task.theghapfy.com';

  Future<CommentCreateModel?> createComment({
    required String body,
    required int postId,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    final url = Uri.parse('$_baseUrl/v1/comments/create');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'body': body,
          'postId': postId,
        }),
      );

      if (response.statusCode == 200 ||response.statusCode==201) {
        final data = jsonDecode(response.body);
        return CommentCreateModel.fromJson(data);
      } else {
        throw Exception('Failed to create comment: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Comment creation error: $e');
    }
  }
}