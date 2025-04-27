import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/models/create_post_model.dart';

class CreatePostService {
  static final CreatePostService _instance = CreatePostService._internal();

  factory CreatePostService() => _instance;

  CreatePostService._internal();

  final String _baseUrl = 'https://task.theghapfy.com';

  Future<CreatePostModel?> createPost({required String postBody}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    final url = Uri.parse('$_baseUrl/v1/posts/create');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
        body: jsonEncode({
          'postBody': postBody,
        }),
      );

      if (response.statusCode == 200 ||response.statusCode==201) {
        final data = jsonDecode(response.body);
        return CreatePostModel.fromJson(data);
      } else {
        throw Exception('Failed to create post: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Post creation error: $e');
    }
  }
}
