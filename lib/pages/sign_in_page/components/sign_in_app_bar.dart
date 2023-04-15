import 'package:flutter/material.dart';

class SignInAppBar extends StatelessWidget {
  const SignInAppBar({super.key});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      centerTitle: true,
      title: const Text('Sign In Page'),
    );
  }
}
