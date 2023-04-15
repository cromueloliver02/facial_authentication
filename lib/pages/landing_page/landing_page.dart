import 'package:flutter/material.dart';

import 'components/landing_view.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  static const String name = 'landing';
  static const String path = '/$name';

  @override
  Widget build(BuildContext context) {
    return const LandingView();
  }
}
