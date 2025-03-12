import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/core/shared_components.dart';
import 'package:wass_project1/core/strings.dart';
import 'package:wass_project1/features/auth/presentation/auth_screen.dart';
import 'package:wass_project1/features/auth/presentation/auth_text_field.dart';
import 'package:wass_project1/features/auth/presentation/otp.dart';

class ForgotPassword extends StatelessWidget {
  const ForgotPassword({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 80.0, left: 32.0, right: 32.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Image.asset(
            "assets/splash.png",
            height: 117.0,
            width: 117.0,
          ),
          const SizedBox(height: 16.0),
          Text(
            forgotPasswordText,
            style: TextStyle(
              color: SharedColors.hintColor,
              fontWeight: FontWeight.w400,
              fontSize: 12.0,
            ),
          ),
          const SizedBox(height: 16.0,),
          const AuthTextField("eMAIL ID", iconName: "assets/phone.png"),
          const SizedBox(height: 40.0),
          AuthScreenButton("Get OTP", () {getOtp(context);})
        ],
      ),
    );
  }
  
  void getOtp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      SharedComponents.routeOf(const OtpScreen()),
    );
  }
}