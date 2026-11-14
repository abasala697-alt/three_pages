import 'package:flutter/material.dart';
import 'package:three_pages/navigation/app_routes.dart';
import 'package:three_pages/theme/app_theme.dart';
import 'package:three_pages/widgets/page_scaffold.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'About',
      currentIndex: 1,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const Icon(Icons.info, size: 56, color: AppTheme.primary),
                const SizedBox(height: 12),
                Text(
                  'About',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 16),
                Card(
                  child: Padding(
                    padding: const EdgeInsets.all(16),
                    child: Text(
                      'This app has three pages: Home, About, and Contact. '
                      'Each page uses a Scaffold and an AppBar, and you can move '
                      'between them with the buttons or the bottom navigation bar.',
                      style: Theme.of(context).textTheme.bodyLarge,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                const Spacer(),
                FilledButton.icon(
                  onPressed:
                      () => Navigator.pushNamed(context, AppRoutes.contact),
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Go to Contact'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
