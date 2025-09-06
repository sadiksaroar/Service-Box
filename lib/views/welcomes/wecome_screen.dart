import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_box/core/colors/colors_widgets.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.splashBackgroundColor,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(height: 50),
                  Text(
                    "Best Helping",
                    style: const TextStyle(
                      fontFamily: "RobotoFlex",
                      fontWeight: FontWeight.w700,
                      fontSize: 30.55,
                      height: 32 / 30.55,
                      letterSpacing: 0,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 20),
                  Text(
                    "With Our On-Demand Services App \n We Give Better Services To You.",
                    style: const TextStyle(
                      fontFamily: "RobotoFlex",
                      fontWeight: FontWeight.w500,
                      fontSize: 13.72,
                      color: Color(0xFF282828),
                      height: 18 / 13.72,
                      letterSpacing: 0.01 * 13.72,
                      fontStyle: FontStyle.normal,
                    ),
                  ),
                  SizedBox(height: 30),
                  Image.asset(
                    "assets/images/welcomeScreen/meanFirstPicutre.png",
                    width: 396,
                    height: 329,
                    fit: BoxFit.contain,
                  ),

                  SizedBox(height: 80),
                  // 📄 Text and Button Section
                  GestureDetector(
                    onTap: () {
                      context.go("/onBoardingScreen");
                    },
                    child: Container(
                      width: 300,
                      height: 52,
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 12,
                      ),
                      decoration: BoxDecoration(
                        color: AppColors
                            .welcomeButtonBackColor, // background color
                        borderRadius: BorderRadius.circular(
                          6,
                        ), // border radius 6px
                      ),
                      child: Text(
                        "Gat Start",
                        style: TextStyle(
                          color: Color(0xFFCCFD04), // Lime Yellow text
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
