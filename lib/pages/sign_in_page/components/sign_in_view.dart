import 'package:flutter/material.dart';

import 'sign_in_app_bar.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: SignInAppBar(),
      ),
      body: Center(
        child: Text('SIGN IN PAGE'),
      ),
    );
  }
}
