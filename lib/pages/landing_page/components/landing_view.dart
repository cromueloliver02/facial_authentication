import 'package:flutter/material.dart';

import 'landing_app_bar.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: LandingAppBar(),
      ),
      body: Center(
        child: Text('LANDING PAGE'),
      ),
    );
  }
}
