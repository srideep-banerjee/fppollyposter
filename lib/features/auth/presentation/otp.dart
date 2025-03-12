import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/core/shared_components.dart';
import 'package:wass_project1/core/strings.dart';
import 'package:wass_project1/features/auth/presentation/auth_screen.dart';
import 'package:wass_project1/features/auth/presentation/new_pass.dart';

class OtpScreen extends StatelessWidget {
  const OtpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final pinputTheme = PinTheme(
        height: 45,
        width: 50,
        textStyle: const TextStyle(fontSize: 20),
        decoration: BoxDecoration(
          border: Border.all(color: SharedColors.primary, width: 0.5),
          borderRadius: BorderRadius.circular(2.0),
        ));

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
          const SizedBox(
            height: 16.0,
          ),
          Pinput(
            length: 6,
            defaultPinTheme: pinputTheme,
          ),
          const SizedBox(height: 16.0),
          Container(
            alignment: Alignment.centerLeft,
            child: Text(
              "Resend OTP again",
              style: TextStyle(
                color: Colors.black.withOpacity(0.99),
                fontSize: 12.0,
                fontWeight: FontWeight.w400,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
          const SizedBox(height: 16.0),
          AuthScreenButton("SUBMIT", () {submitOtp(context);})
        ],
      ),
    );
  }
  
  void submitOtp(BuildContext context) {
    Navigator.of(context).pushReplacement(
      SharedComponents.routeOf(const NewPasswordScreen()),
    );
  }
}