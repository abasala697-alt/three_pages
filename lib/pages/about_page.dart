import 'package:flutter/material.dart';
import '../widgets/page_title.dart';
import 'contact_page.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('About')),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Icon(Icons.person, size: 80, color: Colors.teal),
              const SizedBox(height: 16),
              const PageTitle('About Page'),
              const SizedBox(height: 24),
              ElevatedButton.icon(
                icon: const Icon(Icons.contact_mail),
                label: const Text('Go to Contact'),
                onPressed: () => Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const ContactPage()),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
