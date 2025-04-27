import 'dart:convert';
import 'package:ghapfy_team_app/features/models/user_profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class GetUserProfileService {
  static final GetUserProfileService _instance = GetUserProfileService._internal();

  factory GetUserProfileService() => _instance;

  GetUserProfileService._internal();

  final String _baseUrl = 'https://task.theghapfy.com';

  Future<UserProfileModel?> getUserProfile() async {
    final prefs = await SharedPreferences.getInstance();
    final token = prefs.getString('auth_token');

    final url = Uri.parse('$_baseUrl/v1/user/me');

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
        return UserProfileModel.fromJson(data);
      } else {
        throw Exception('Failed to load profile: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Profile fetch error: $e');
    }
  }
}
