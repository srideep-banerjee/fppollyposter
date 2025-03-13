import 'dart:async';

import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/core/strings.dart';
import 'package:wass_project1/features/auth/presentation/auth_screen.dart';
import 'package:wass_project1/features/auth/presentation/auth_text_field.dart';

class NewPasswordScreen extends StatelessWidget {
  const NewPasswordScreen({super.key});

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
          const SizedBox(height: 16.0),
          const AuthTextField("enter new password", obscureText: true),
          const SizedBox(height: 16.0),
          const AuthTextField("re-enter password", obscureText: true),
          const SizedBox(height: 40.0),
          AuthScreenButton("SUBMIT", () {
            submitPassword(context);
          })
        ],
      ),
    );
  }

  void submitPassword(BuildContext context) {
    showConfirmationDialog(context);
  }

  Future<void> showConfirmationDialog(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (context) {
        return Dialog(
          elevation: 0,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(
                color: SharedColors.dialogBorderColor,
                width: 0.5,
              ),
              borderRadius: BorderRadius.circular(16.0),
            ),
            padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 48),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Image.asset(
                  "assets/pass_change_confirm.png",
                  height: 51,
                  width: 51,
                ),
                const SizedBox(height: 16),
                Text(
                  forgotPasswordText,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: SharedColors.hintColor,
                    fontWeight: FontWeight.w400,
                    fontSize: 12.0,
                  ),
                ),
                const SizedBox(height: 80),
                OutlinedButton(
                  style: OutlinedButton.styleFrom(
                    backgroundColor: SharedColors.primaryDark,
                    foregroundColor: SharedColors.buttonTextColor,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(4.0),
                    ),
                    side: const BorderSide(
                      color: SharedColors.buttonBorderColor,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Container(
                    padding: const EdgeInsets.symmetric(horizontal: 32),
                    child: const Text(
                      "GOT IT",
                      style: TextStyle(
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                        color: SharedColors.buttonTextColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
