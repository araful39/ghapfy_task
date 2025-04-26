import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';
import '../../features/models/feed_model.dart';

class FeedService {
  static final FeedService _instance = FeedService._internal();

  factory FeedService() => _instance;

  FeedService._internal();

  final String _baseUrl = 'https://task.theghapfy.com';

  Future<FeedModel>? getFeeds({int currentPage = 0, int pageView = 10}) async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    final url = Uri.parse('$_baseUrl/v1/posts?currentPage=$currentPage&pageView=$pageView');

    try {
      final response = await http.get(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200) {
        final data = jsonDecode(response.body);
        return FeedModel.fromJson(data);
      } else {
        throw Exception('Failed to fetch feeds: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Feed fetch error: $e');
    }
  }
}
