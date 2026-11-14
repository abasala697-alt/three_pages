import 'package:flutter/material.dart';
import 'package:three_pages/navigation/app_routes.dart';

class PageScaffold extends StatelessWidget {
  const PageScaffold({
    super.key,
    required this.title,
    required this.currentIndex,
    required this.body,
  });

  final String title;
  final int currentIndex;
  final Widget body;

  void _onTabSelected(BuildContext context, int index) {
    if (index == currentIndex) {
      return;
    }
    Navigator.pushReplacementNamed(context, AppRoutes.tabRoutes[index]);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(title)),
      body: SafeArea(child: body),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) => _onTabSelected(context, index),
        showSelectedLabels: true,
        showUnselectedLabels: true,
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: 'Home'),
          BottomNavigationBarItem(
            icon: Icon(Icons.info_outline),
            label: 'About',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.mail_outline),
            label: 'Contact',
          ),
        ],
      ),
    );
  }
}
