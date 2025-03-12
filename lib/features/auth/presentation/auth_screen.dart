import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';
import 'package:wass_project1/features/auth/presentation/login.dart';

class AuthScreen extends StatefulWidget {
  const AuthScreen({super.key});

  @override
  State<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends State<AuthScreen> {
  @override
  Widget build(BuildContext context) {
    return const LoginScreen();
  }
}

class AuthScreenButton extends StatelessWidget {
  final String data;
  final void Function() onClick;
  const AuthScreenButton(this.data, this.onClick, {super.key});

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      style: OutlinedButton.styleFrom(
          backgroundColor: SharedColors.primaryDark,
          foregroundColor: SharedColors.buttonTextColor,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(2.0)),
          side: const BorderSide(color: SharedColors.buttonBorderColor)),
      onPressed: onClick,
      child: Container(
        alignment: Alignment.center,
        padding: const EdgeInsets.symmetric(vertical: 16.0),
        child: Text(
          data,
          textAlign: TextAlign.start,
          style: const TextStyle(fontSize: 12.0, fontWeight: FontWeight.w400),
        ),
      ),
    );
  }
}
