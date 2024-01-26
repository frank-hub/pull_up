import 'package:flutter/material.dart';
import 'package:pull_up/Onboboarding/onboarding_view.dart';
import 'package:pull_up/screens/splash_screen.dart';

void main() {
  runApp(const MaterialApp( home:  MyApp(),));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const OnboardingView();
  }
}
