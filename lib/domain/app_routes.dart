import 'package:flutter/material.dart';
import 'package:spotify_clone/ui/intro/intro_page.dart';
import 'package:spotify_clone/ui/login/login_page.dart';

import '../ui/splash/splash_page.dart';

class AppRoutes{

  static const String splash_page = '/splash';
  static const String intro_page = '/intro';
  static const String login_page = '/login';

  static Map<String, Widget Function(BuildContext)> routes = {
    splash_page: (context) => SplashPage(),
    intro_page: (context) => IntroPage(),
    login_page: (context) => LoginPage(),
  };
}