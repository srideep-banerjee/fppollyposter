import 'package:flutter/material.dart';

class SharedComponents {
  static Widget scaffolded(Widget child) {
    return Scaffold(
      body: SafeArea(child: child),
    );
  }
}