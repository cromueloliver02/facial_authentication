import 'package:flutter/material.dart';

class LandingAppBar extends StatelessWidget {
  const LandingAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Landing Page'),
    );
  }
}
