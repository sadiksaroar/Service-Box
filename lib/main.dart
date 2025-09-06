import 'package:device_preview/device_preview.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:service_box/core/routes/app_routes.dart';

void main() => runApp(
  DevicePreview(
    enabled: !kReleaseMode,
    builder: (context) => MyApp(), // Wrap your app
  ),
);

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      minTextAdapt: true,
      splitScreenMode: true,
      designSize: Size(375, 812), // Example design size, adjust as needed
      child: MaterialApp.router(
        debugShowCheckedModeBanner: false,
        routerConfig:
            AppRoutes.router, // Using the router configuration from AppRoutes
        title: 'SeviceBox', // Changed to your app name
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true, // Consider adding this for Material 3 design
        ),
      ),
    );
  }
}
