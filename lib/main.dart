import 'package:flutter/material.dart';
import 'package:three_pages/navigation/app_routes.dart';
import 'package:three_pages/screens/about_page.dart';
import 'package:three_pages/screens/contact_page.dart';
import 'package:three_pages/screens/home_page.dart';
import 'package:three_pages/theme/app_theme.dart';

void main() {
  runApp(const ThreePagesApp());
}

class ThreePagesApp extends StatelessWidget {
  const ThreePagesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Three Pages',
      theme: AppTheme.light,
      initialRoute: AppRoutes.home,
      routes: {
        AppRoutes.home: (context) => const HomePage(),
        AppRoutes.about: (context) => const AboutPage(),
        AppRoutes.contact: (context) => const ContactPage(),
      },
    );
  }
}
