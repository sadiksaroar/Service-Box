import 'package:go_router/go_router.dart';
import 'package:service_box/app/views/screens/splash/splash_screen.dart';
import 'package:service_box/app/views/screens/welcome/weal_come_screen.dart';

class AppRoutes {
  static const String splashScreen = "/";
  static const String welcomeScreen = "/welcome";

  //  app routes
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: welcomeScreen,
        builder: (context, state) => const WelcomeScreen(), // <-- Un-commented
      ),
    ],
  );
}
