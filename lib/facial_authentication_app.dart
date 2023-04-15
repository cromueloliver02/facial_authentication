import 'package:flutter/material.dart';

import 'configs/configs.dart';

class FacialAuthenticationApp extends StatelessWidget {
  const FacialAuthenticationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: 'Facial Authentication',
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark(),
      routerConfig: AppRouter.router,
    );
  }
}
