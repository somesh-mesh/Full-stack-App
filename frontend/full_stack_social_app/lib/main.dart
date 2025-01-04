import 'package:flutter/material.dart';
import 'package:full_stack_social_app/ui/home/home_screen.dart';
import 'package:full_stack_social_app/ui/login/login_screen.dart';
import 'package:full_stack_social_app/ui/signup/signup.dart';
import 'package:go_router/go_router.dart';

void main() {
  runApp(const MyApp());
}

/// The route configuration.
final GoRouter _router = GoRouter(
  routes: <RouteBase>[
    GoRoute(
      path: '/',
      builder: (BuildContext context, GoRouterState state) {
        return const LoginScreen();
      },
      routes: <RouteBase>[
        GoRoute(
          path: '/homescreen', // Directly under root
          builder: (BuildContext context, GoRouterState state) {
            return const HomeScreen();
          },
        ),
         GoRoute(
          path: '/signupscreen', // Directly under root
          builder: (BuildContext context, GoRouterState state) {
            return const SignupScreen();
          },
        ),
      ],
    ),
  ],
);

class MyApp extends StatelessWidget {
  /// Constructs a [MyApp]
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routeInformationParser: _router.routeInformationParser,
      routerDelegate: _router.routerDelegate,
      routeInformationProvider: _router.routeInformationProvider,
    );
  }
}
