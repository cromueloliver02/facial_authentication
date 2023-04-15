import 'package:flutter/material.dart';

import 'components/sign_in_view.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({super.key});

  static const String name = 'sign-in';
  static const String path = name;

  @override
  Widget build(BuildContext context) {
    return const SignInView();
  }
}
