import 'package:flutter/material.dart';

import 'facial_authentication_app.dart';
import 'configs/app_dependencies.dart' as di;

void main() {
  WidgetsFlutterBinding.ensureInitialized();

  di.setup();

  runApp(const FacialAuthenticationApp());
}
