import 'package:go_router/go_router.dart';
import 'package:service_box/core/routes/route_names.dart';
import 'package:service_box/views/auth/entrcode/enter_code.dart';
import 'package:service_box/views/auth/forgetPasswordScreen/forget_password.dart';
import 'package:service_box/views/auth/newPassword/new_password.dart';
import 'package:service_box/views/auth/newPassword/popup_screen.dart';
import 'package:service_box/views/auth/signIn/sign_inPage.dart';
import 'package:service_box/views/auth/signUp/sign_up.dart';
import 'package:service_box/views/onboarding/onbording.dart';
import 'package:service_box/views/screens/booking/booking_screen.dart';
import 'package:service_box/views/screens/chat/chat.dart';
import 'package:service_box/views/screens/home/home.dart';
import 'package:service_box/views/screens/maps/search.dart';
import 'package:service_box/views/screens/menu/menu.dart';
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
      GoRoute(
        path: AppRoutePaths.forgetPassword,
        builder: (context, state) => ForgetPasswordScreen(),
      ),
      GoRoute(
        path: AppRoutePaths.enterCode,
        builder: (context, state) => EnterCode(),
      ),
      /* auth screen end  here */

      /* auth screen end here */
      // ===================<>===============//

      /* home screen start here */
      GoRoute(
        path: AppRoutePaths.homeViewPage,
        builder: (context, state) => HomeViewPage(),
      ),
      /* home screen end  here */

      // ===================<>===============//
      /* search screen start here */
      GoRoute(
        path: AppRoutePaths.search,
        builder: (context, state) => Search(),
      ),
      /* search screen end  here */
      // ===================<>===============//

      /* Bookings screen start here */
      GoRoute(
        path: AppRoutePaths.bookings,
        builder: (context, state) => BookingScreen(),
      ),
      /* Bookings screen end  here */
      // ===================<>===============//

      /* Chat screen start here */
      GoRoute(
        path: AppRoutePaths.chat, // sadik
        builder: (context, state) => Chat(),
      ),
      /* Chat screen end  here */
      // ===================<>===============//

      /* Profile screen start here */
      GoRoute(
        path: AppRoutePaths.menue, // sadik
        builder: (context, state) => const Menue(),
      ),
      /* Profile screen end  here */
    ],
  );
}
