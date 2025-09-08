import 'package:go_router/go_router.dart';
import 'package:service_box/core/routes/route_names.dart';
import 'package:service_box/views/auth/newPassword/new_password.dart';
import 'package:service_box/views/auth/newPassword/popup_screen.dart';
import 'package:service_box/views/auth/signIn/sign_inPage.dart';
import 'package:service_box/views/auth/signUp/sign_up.dart';
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

      /* auth screen start here */
      GoRoute(
        path: AppRoutePaths.welcomeScreen,
        builder: (context, state) => const WelcomeScreen(), // <-- Un-commented
      ),
      GoRoute(
        path: AppRoutePaths.onBoardingScreen,
        builder: (context, state) => OnBoardingScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.signIn,
        builder: (context, state) => SiginInViews(),
      ),
      GoRoute(
        path: AppRoutePaths.signUp,
        builder: (context, state) => SignUp(),
      ),
      GoRoute(
        path: AppRoutePaths.newPassword,
        builder: (context, state) => NewPassword(),
      ),
      GoRoute(
        path: AppRoutePaths.popupScreen,
        builder: (context, state) => CongratulationsPopup(),
      ),
      /* auth screen end  here */
    ],
  );
}
