import 'package:go_router/go_router.dart';

import '../pages/pages.dart';

class AppRouter {
  static final GoRouter router = GoRouter(
    initialLocation: LandingPage.path,
    routes: [
      GoRoute(
        name: LandingPage.name,
        path: LandingPage.path,
        builder: (ctx, state) => const LandingPage(),
        routes: [
          GoRoute(
            name: SignInPage.name,
            path: SignInPage.path,
            builder: (ctx, state) => const SignInPage(),
          ),
          GoRoute(
            name: SignUpPage.name,
            path: SignUpPage.path,
            builder: (ctx, state) => const SignUpPage(),
          ),
        ],
      ),
      GoRoute(
        name: HomePage.name,
        path: HomePage.path,
        builder: (ctx, state) => const HomePage(),
      ),
    ],
  );
}
