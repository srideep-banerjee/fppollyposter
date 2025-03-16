import 'package:flutter/material.dart';
import 'package:wass_project1/core/shared_components.dart';
import 'package:wass_project1/features/auth/presentation/auth_screen.dart';
import 'package:wass_project1/features/auth/presentation/auth_text_field.dart';
import 'package:wass_project1/features/auth/presentation/forgot_password.dart';
import 'package:wass_project1/features/dashboard/presentation/dashboard.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

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
          const AuthTextField("Enter phone no", iconName: "assets/phone.png",),
          const SizedBox(height: 24.0),
          const AuthTextField("Enter password", iconName: "assets/lock.png", obscureText: true,),
          // const SizedBox(height: 8.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              TextButton(
                onPressed: () {forgotPassword(context);},
                child: const Text(
                  "Forgot password",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 12.0,
                    fontWeight: FontWeight.w700,
                    decoration: TextDecoration.underline
                  ),
                ),
              ),
              TextButton(
                onPressed: createAnAccount, 
                child: Text(
                  "Create an account",
                  style: TextStyle(
                    color: Colors.black.withOpacity(0.99),
                    fontSize: 12.0,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
          const SizedBox(height: 24),
          AuthScreenButton("Login", () {login(context);})
        ],
      ),
    );
  }
  
  void forgotPassword(BuildContext context) {
    Navigator.push(
      context,
      SharedComponents.routeOf(const ForgotPassword()),
    );
  }
  
  void createAnAccount() {
    
  }
  
  void login(BuildContext context) {
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (_) {
          return const Dashboard();
        },
      )
    );
  }
}