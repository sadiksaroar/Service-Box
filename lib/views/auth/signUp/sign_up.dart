import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:service_box/core/colors/colors_widgets.dart';
import 'package:service_box/core/widgets/custom_app_subtitleText.dart';
import 'package:service_box/core/widgets/custom_button.dart';
import 'package:service_box/core/widgets/custom_headingText.dart';
import 'package:service_box/core/widgets/custom_textField.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();

  bool rememberMe = false;
  bool isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        toolbarHeight: 80,
        centerTitle: true,
        title: Image.asset("assets/images/Logo 4.png", height: 83, width: 88),
        leading: IconButton(
          icon: Image.asset(
            "assets/icons/Back_Icon.png",
            height: 44,
            width: 44,
          ),
          onPressed: () {
            context.push('/signin');
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
                // crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Center(
                    child: Container(
                      width: 250,
                      height: 60,
                      decoration: BoxDecoration(
                        // color: const Color(0xFF5B9BD5),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Center(child: AppHeadingText("Sign Up")),
                    ),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const AppSubtitleText('Name'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    // label: "Email",
                    // icon: Icons.email, // You need to specify an icon here
                    hintText: "Emily smith",
                    controller: nameController,
                    opatictyColor: '', // Optional, only if needed
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Email'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    // label: "Email",
                    // icon: Icons.email, // You need to specify an icon here
                    hintText: "emilysm@gmail.com",
                    controller: emailController,
                    opatictyColor: '', // Optional, only if needed
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Password'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "*********",
                    controller: passwordController,
                    isPassword: true,
                    opatictyColor: '', // This enables suffixIcon toggle
                  ),
                  const SizedBox(height: 12),
                  const AppSubtitleText('Confirm Password'),
                  const SizedBox(height: 12),
                  CustomTextField(
                    hintText: "*********",
                    controller: confirmPasswordController,
                    isPassword: true,
                    opatictyColor: '', // This enables suffixIcon toggle
                  ),
                  const SizedBox(height: 12),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Checkbox(
                            value: rememberMe,
                            onChanged: (value) {
                              setState(() {
                                rememberMe = value ?? false;
                              });
                            },
                            activeColor: const Color(0xFF5B9BD5),
                            // materialTapTargetSize: materialTapTargetSize.shri,
                            materialTapTargetSize:
                                MaterialTapTargetSize.shrinkWrap,
                            visualDensity: VisualDensity.compact,
                          ),

                          const Text(
                            'I agree with the terms and policies.',
                            style: TextStyle(
                              fontFamily: 'Open Sans',
                              color: Color(0xFF848484),
                              fontWeight: FontWeight.w600, // SemiBold
                              fontStyle: FontStyle
                                  .normal, // SemiBold has no specific font-style in Flutter
                              fontSize: 18.0,
                              height:
                                  1.0, // 100% line-height (this is the same as line-height: 100%)
                              letterSpacing: 0.0, // 0% letter-spacing
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 40),
                    ],
                  ),
                ],
              ),

              SizedBox(height: 25),

              CustomButton(
                backgroundColor: AppColors.buttonColor,
                text: "Sign up",
                onPressed: () {
                  // Your action here
                },
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 50, // adjust this width as needed
                    child: Divider(thickness: 0.8, color: Colors.grey),
                  ),
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 8.0),
                    child: Text(
                      "or",
                      style: TextStyle(color: Colors.grey, fontSize: 14),
                    ),
                  ),
                  SizedBox(
                    width: 50, // adjust this width as needed
                    child: Divider(thickness: 0.8, color: Colors.grey),
                  ),
                ],
              ),

              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset("assets/icons/Google.png", height: 70, width: 70),
                  const SizedBox(width: 16),
                  Image.asset("assets/icons/Apple.png", height: 70, width: 70),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
