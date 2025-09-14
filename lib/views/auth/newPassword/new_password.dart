import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_box/core/colors/colors_widgets.dart';
import 'package:service_box/core/widgets/custom_app_subtitleText.dart';
import 'package:service_box/core/widgets/custom_button.dart';
import 'package:service_box/core/widgets/custom_headingText.dart';
import 'package:service_box/core/widgets/custom_textField.dart';
import 'package:service_box/views/auth/newPassword/popup_screen.dart';
// import 'CongratulationsPopup.dart'; // Import the CongratulationsPopup class

class NewPassword extends StatefulWidget {
  const NewPassword({super.key});

  @override
  State<NewPassword> createState() => _NewPasswordState();
}

class _NewPasswordState extends State<NewPassword> {
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        title: Image.asset(
          "assets/images/Group 133553.png",
          height: 83,
          width: 88,
        ),
        leading: IconButton(
          icon: Image.asset(
            "assets/images/icon/Back_Icon.png",
            height: 44,
            width: 44,
          ),
          onPressed: () {
            context.pop('/signin');
          },
        ),
        elevation: 0,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                children: [
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: AppHeadingText("Set new password")),
                    ),
                  ),
                  SizedBox(height: 15),
                  Center(
                    child: Container(
                      width: 805,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(
                        child: Text(
                          "Please enter a new password and re-enter to confirm.",
                          style: TextStyle(
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            fontSize: 18.0,
                            color: Color(0xFF848484),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 15),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('New Password'),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: newPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              SizedBox(height: 25),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Confirm Password'),
                  SizedBox(height: 10),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '',
                  ),
                ],
              ),
              SizedBox(height: 25),
              CustomButton(
                backgroundColor: AppColors.buttonColor,
                text: "Continue",
                onPressed: () => CongratulationsPopup.show(context),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
