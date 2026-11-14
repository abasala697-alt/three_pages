import 'package:flutter/material.dart';
import 'package:three_pages/navigation/app_routes.dart';
import 'package:three_pages/theme/app_theme.dart';
import 'package:three_pages/widgets/page_scaffold.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Home',
      currentIndex: 0,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              children: [
                const Icon(Icons.home, size: 56, color: AppTheme.primary),
                const SizedBox(height: 12),
                Text(
                  'Home',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Welcome. Use the button below or the bottom bar to move between pages.',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Image.asset(
                      'assets/images/home.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                const SizedBox(height: 24),
                FilledButton.icon(
                  onPressed:
                      () => Navigator.pushNamed(context, AppRoutes.about),
                  icon: const Icon(Icons.arrow_forward),
                  label: const Text('Go to About'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
