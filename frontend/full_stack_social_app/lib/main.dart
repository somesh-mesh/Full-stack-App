import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:full_stack_social_app/presentations/home/home_screen.dart';
import 'package:full_stack_social_app/presentations/login/login_screen.dart';
import 'package:full_stack_social_app/presentations/signup/signup.dart';
import 'package:go_router/go_router.dart';

Future<void> main() async {
   WidgetsFlutterBinding.ensureInitialized();

  /// Set system UI mode to show status and navigation bars
  SystemChrome.setEnabledSystemUIMode(SystemUiMode.edgeToEdge);

  /// Optionally, set the system overlay style (status bar color, icon brightness)
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,

      /// Set transparent if you want the app content to go behind the status bar
      statusBarIconBrightness: Brightness.dark,

      /// Change to Brightness.light for light-colored icons
      systemNavigationBarColor: Colors.black,

      /// Adjust navigation bar color
    ),
  );
   await dotenv.load(fileName: Environment.fileName);
  runApp(const MyApp());
  }
  
  class Environment {
  static String get fileName =>
      kReleaseMode ? ".env.production" : ".env.development";

        static String get baseUrl => dotenv.env['SERVER_BASE_URL'] ?? '';

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
