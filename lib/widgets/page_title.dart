import 'package:flutter/material.dart';

/// Reusable page title text.
class PageTitle extends StatelessWidget {
  final String text;
  const PageTitle(this.text, {super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context)
          .textTheme
          .headlineMedium
          ?.copyWith(fontWeight: FontWeight.bold),
    );
  }
}
