import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:service_box/app/utlies/apps_color.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    // 3 সেকেন্ড পর welcome page এ যাবে
    Future.delayed(const Duration(seconds: 3), () {
      if (mounted) {
        context.go('/welcome'); // go_router এর route path
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// ✅ image path থেকে space সরাও
            Image.asset(
              "assets/images/splashScreenLogo.png", // ফাইলের নাম পরিবর্তন করে দাও
              height: 250.h,
              width: 250.w,
              fit: BoxFit.contain,
            ),
            SizedBox(height: 15.h),
            CircularProgressIndicator(color: AppColors.grey, strokeWidth: 3),
          ],
        ),
      ),
    );
  }
}
