import 'package:flutter/material.dart';

class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: MediaQuery.of(context).size.height * 0.1),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              height: 100,
              child: const Image(
                  image: AssetImage('assets/images/logo_color.png')),
            ),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text.rich(
                TextSpan(
                  text: 'Welcome  👋\n',
                  style: TextStyle(
                    fontSize: 26,
                    color: Color(0xFF101317),
                    fontWeight: FontWeight.bold,
                  ),
                  children: [
                    TextSpan(
                      text: 'to ',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFF101317),
                      ),
                    ),
                    TextSpan(
                      text: 'Demoz Payroll',
                      style: TextStyle(
                        fontSize: 28,
                        color: Color(0xFF3085FE),
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Hello there, Sign up to continue',
                style: TextStyle(color: Color(0xFFACAFB5), fontSize: 14),
              ),
            )
          ],
        ),
      ),
    );
  }
}
