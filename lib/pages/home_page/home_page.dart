import 'package:flutter/material.dart';

import 'components/home_view.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  static const String name = 'home';
  static const String path = '/$name';

  @override
  Widget build(BuildContext context) {
    return const HomeView();
  }
}
