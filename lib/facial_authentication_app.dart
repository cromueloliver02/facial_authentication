import 'package:flutter/material.dart';

import 'configs/app_dependencies.dart';
import 'configs/configs.dart';

class FacialAuthenticationApp extends StatelessWidget {
  const FacialAuthenticationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: sl.allReady(),
      builder: (BuildContext context, AsyncSnapshot snapshot) {
        if (!snapshot.hasData) return const SizedBox.shrink();

        return MaterialApp.router(
          title: 'Facial Authentication',
          debugShowCheckedModeBanner: false,
          theme: ThemeData.dark(),
          routerConfig: AppRouter.router,
        );
      },
    );
  }
}
