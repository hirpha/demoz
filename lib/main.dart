import 'package:demoz/features/auth/presentation/pages/register.dart';
import 'package:demoz/features/auth/presentation/pages/signin.dart';
import 'package:demoz/onboarding.dart';
import 'package:demoz/splash.dart';
import 'package:flutter/material.dart';

import 'features/employe/presentation/pages/employee.dart';
import 'features/home/presentation/pages/calendar.dart';
import 'features/home/presentation/pages/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Demoz',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      onGenerateRoute: (settings) {
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(
                builder: (context) => const SplashScreen());
          case '/onboarding':
            return MaterialPageRoute(
                builder: (context) => const OnboardingScreen());
          case '/signin':
            return MaterialPageRoute(builder: (context) => const SignInPage());
          case '/register':
            return MaterialPageRoute(
                builder: (context) => const RegisterPage());
          case '/home':
            return MaterialPageRoute(builder: (context) => const HomePage());
          case '/calendar':
            return MaterialPageRoute(
                builder: (context) => const CalendarPage());
          case '/employee':
            return MaterialPageRoute(
                builder: (context) => const EmployeeScreen());
          default:
            return MaterialPageRoute(
                builder: (context) => const SplashScreen());
        }
      },
    );
  }
}
