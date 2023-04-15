import 'package:flutter/material.dart';

import 'sign_up_app_bar.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SignUpAppBar(),
      ),
      body: Center(
        child: Text('SIGN UP PAGE'),
      ),
    );
  }
}
