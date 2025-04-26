import 'package:get/get.dart';

import '../view/comment_screen.dart';
import '../view/feed_screen.dart';
import '../view/login_screen.dart';
import '../view/post_create_screen.dart';
import '../view/profile_screen.dart';


class AppRoutes {
  static const login = '/login';
  static const feed = '/feed';
  static const createPost = '/create-post';
  static const comment = '/comment';
  static const profile = '/profile';

  static final routes = [
    GetPage(name: login, page: () => LoginScreen()),
    GetPage(name: feed, page: () => FeedScreen()),
    GetPage(name: createPost, page: () => PostCreateScreen()),
    // GetPage(name: comment, page: () => CommentScreen()),
    GetPage(name: profile, page: () => ProfileScreen()),
  ];
}
