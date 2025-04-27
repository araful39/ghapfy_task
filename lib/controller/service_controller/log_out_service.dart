import 'dart:convert';
import 'package:ghapfy_team_app/features/models/logout_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class LogoutService {
  static final LogoutService _instance = LogoutService._internal();

  factory LogoutService() => _instance;

  LogoutService._internal();

  final String _baseUrl = 'https://task.theghapfy.com';

  Future<LogOutModel?> logoutUser() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    final url = Uri.parse('$_baseUrl/v1/user/logout');

    try {
      final response = await http.post(
        url,
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $token',
        },
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        final data = jsonDecode(response.body);
        return LogOutModel.fromJson(data);
      } else {
        throw Exception('Logout failed: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Logout error: $e');
    }
  }
}
