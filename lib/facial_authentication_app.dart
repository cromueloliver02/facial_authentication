import 'package:flutter/material.dart';

class FacialAuthenticationApp extends StatelessWidget {
  const FacialAuthenticationApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Facial Authentication',
      theme: ThemeData.dark(),
      home: const Scaffold(
        body: Center(
          child: Text('FACIAL AUTHENTICATION APP'),
        ),
      ),
    );
  }
}
