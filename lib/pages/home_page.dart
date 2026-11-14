import 'package:flutter/material.dart';
import '../widgets/page_title.dart';
import 'about_page.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Home')),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(16),
                child: Image.network(
                  'https://flutter.dev/assets/images/shared/brand/flutter/logo/flutter-lockup.png',
                  height: 150,
                  errorBuilder: (_, __, ___) =>
                      const Icon(Icons.image_not_supported, size: 100),
                ),
              ),
              const SizedBox(height: 24),
              const PageTitle('Home Page'),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.info),
                label: const Text('Go to About'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const AboutPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
