import 'package:go_router/go_router.dart';
import 'package:service_box/core/routes/route_names.dart';
import 'package:service_box/views/onboarding/onbording.dart';
import 'package:service_box/views/splash/splash_view.dart';
import 'package:service_box/views/welcomes/wecome_screen.dart';

class AppRoutes {
  //  app routes
  static final GoRouter router = GoRouter(
    routes: [
      GoRoute(
        path: AppRoutePaths.splashScreen,
        builder: (context, state) => const SplashScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.welcomeScreen,
        builder: (context, state) => const WelcomeScreen(), // <-- Un-commented
      ),
      GoRoute(
        path: AppRoutePaths.onBoardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),
    ],
  );
}
