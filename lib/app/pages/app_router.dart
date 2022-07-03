import 'package:english_card/app/pages/home/home_page.dart';
import 'package:flutter/material.dart';

class AppRouter {
  static const homePage = '/';

  AppRouter._();

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case homePage:
        return MaterialPageRoute(builder: (_) => const HomePage());
      default:
        throw const FormatException('Route not found');
    }
  }
}