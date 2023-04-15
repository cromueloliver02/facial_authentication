import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../pages.dart';
import 'landing_app_bar.dart';

class LandingView extends StatelessWidget {
  const LandingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: LandingAppBar(),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton.icon(
              onPressed: () => context.goNamed(SignInPage.name),
              icon: const Icon(Icons.login),
              label: const Text('Sign In'),
            ),
            const SizedBox(height: 10),
            ElevatedButton.icon(
              onPressed: () => context.goNamed(SignUpPage.name),
              icon: const Icon(Icons.face),
              label: const Text('Sign Up'),
            ),
          ],
        ),
      ),
    );
  }
}
