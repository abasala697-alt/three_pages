import 'package:flutter/material.dart';
import 'package:three_pages/theme/app_theme.dart';
import 'package:three_pages/widgets/page_scaffold.dart';

class ContactPage extends StatelessWidget {
  const ContactPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageScaffold(
      title: 'Contact',
      currentIndex: 2,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: ConstrainedBox(
            constraints: const BoxConstraints(maxWidth: 560),
            child: Column(
              children: [
                const Icon(Icons.mail, size: 56, color: AppTheme.primary),
                const SizedBox(height: 12),
                Text(
                  'Contact',
                  textAlign: TextAlign.center,
                  style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: AppTheme.primary,
                  ),
                ),
                const SizedBox(height: 20),
                const Card(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Icon(Icons.email_outlined),
                        title: Text('Email'),
                        subtitle: Text('hello@example.com'),
                      ),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.phone_outlined),
                        title: Text('Phone'),
                        subtitle: Text('+1 555 010 2030'),
                      ),
                      Divider(height: 1),
                      ListTile(
                        leading: Icon(Icons.location_on_outlined),
                        title: Text('Address'),
                        subtitle: Text('12 Campus Road'),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
