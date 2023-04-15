import 'package:flutter/material.dart';

import 'components/sign_up_view.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

  static const String name = 'sign-up';
  static const String path = name;

  @override
  Widget build(BuildContext context) {
    return const SignUpView();
  }
}
