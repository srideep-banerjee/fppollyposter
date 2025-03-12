import 'package:flutter/material.dart';
import 'package:wass_project1/config/colors.dart';

class AuthTextField extends StatelessWidget {
  final String? iconName;
  final TextEditingController? controller;
  final String hint;
  final bool obscureText;
  const AuthTextField(this.hint, {super.key, this.iconName, this.controller, this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    
    List<Widget> children = [];

    if (iconName != null) {
      children.addAll([
        Image.asset(iconName!, width: 16.0, height: 16.0),
        const SizedBox(width: 12.0,),
        Container(height: 25, width: 1.0, decoration: const BoxDecoration(color: Colors.black),),
        const SizedBox(width: 12.0,),
      ]);
    }
    
    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: SharedColors.primary,
        ),
        borderRadius: BorderRadius.circular(2.0)
      ),
      padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ... children,
          const SizedBox(width: 0, height: 25,),
          Expanded(
            child: TextField(
              obscureText: obscureText,
              controller: controller,
              decoration: InputDecoration.collapsed(
                hintText: hint,
                hintStyle: TextStyle(color: SharedColors.hintColor),
              ),
              // style: const TextStyle(fontSize: 12.0),
            ),
          ),
        ],
      ),
    );
  }
}