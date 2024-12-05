import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../main.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      checkCompany();
    });
  }

  Future checkCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String companyId = prefs.getString('companyId') ?? '';
    if (companyId.isEmpty) {
      Navigator.pushReplacementNamed(context, '/onboarding');
    } else {
      Navigator.pushReplacementNamed(context, '/home');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFF579AFC),
      body: Center(
        child: Image.asset('assets/images/splash_logo.png'),
      ),
    );
  }
}
