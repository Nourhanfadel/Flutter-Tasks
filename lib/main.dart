import 'package:flutter/material.dart';
import 'package:day2/screens/onboarding_screen.dart';
// import 'package:day2/screens/sign_up.dart';
// import 'screens/sign_in_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Team Management App',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: const OnboardingScreen(),
      // home:  SignInScreen(), 
      // home:  SignUpScreen(),

    );
  }
}
