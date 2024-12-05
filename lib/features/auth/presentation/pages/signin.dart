import 'package:demoz/core/validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../bloc/auth_bloc.dart';
import '../widgets/textfiled.dart';

class SignInPage extends StatefulWidget {
  String login;
  SignInPage({super.key, required this.login});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  bool _obscureText = true;
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  String? emailError;
  String? passwordError;

  bool isAllFieldValid() {
    return emailController.text.isNotEmpty &&
        passwordController.text.isNotEmpty &&
        emailError == null &&
        passwordError == null;
  }

  void emailOnChange(String value) {
    setState(() {
      emailError = emailValidator(value);
      isAllFieldValid();
    });
  }

  void passwordOnChange(String value) {
    setState(() {
      passwordError = passwordValidator(value);
      isAllFieldValid();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
          child: Form(
        autovalidateMode: AutovalidateMode.always,
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
            ),
            const SizedBox(height: 20),
            TextFieldWidget(
              onChange: emailOnChange,
              hintText: 'Email Address',
              controller: emailController,
              errorText: emailError,
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              alignment: Alignment.centerLeft,
              height: 65,
              padding: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(15),
                border: Border.all(
                  color: passwordError != null
                      ? Colors.red
                      : const Color.fromARGB(255, 7, 110, 194),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              'Password',
                              style: TextStyle(
                                color: passwordError != null
                                    ? Colors.red
                                    : const Color(0xFFACAFB5),
                                fontSize: 14,
                              ),
                            ),
                            TextFormField(
                              obscureText: _obscureText,
                              // validator: passwordValidator,
                              onChanged: passwordOnChange,
                              controller: passwordController,
                              decoration: const InputDecoration.collapsed(
                                hintText: '',
                                hintStyle: TextStyle(
                                  color: Color(0xFFACAFB5),
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      IconButton(
                        icon: Icon(
                          _obscureText
                              ? Icons.visibility
                              : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _obscureText = !_obscureText;
                          });
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
            if (passwordError != null)
              Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Text(
                  passwordError!,
                  style: const TextStyle(
                    color: Colors.red,
                    fontSize: 12,
                  ),
                ),
              ),
            const SizedBox(height: 20),
            BlocConsumer<AuthBloc, AuthState>(listener: (context, state) {
              if (state is AuthSuccess) {
                Navigator.pushNamed(context, '/home');
              }
              if (state is AuthFailure) {
                ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Invalid email or password')));
              }
              if (state is AuthCheckEmailFailure) {
                ScaffoldMessenger.of(context)
                    .showSnackBar(SnackBar(content: Text(state.message)));
              }
              if (state is AuthCheckEmailSuccess) {
                if (widget.login == 'signup') {
                  Navigator.pushNamed(context, '/register',
                      arguments: {'email': emailController.text});
                } else {
                  context.read<AuthBloc>().add(AuthSignInEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ));
                }
              }
            }, builder: (context, state) {
              return Container(
                height: 60,
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    fixedSize: const Size(double.infinity, 6),
                    backgroundColor: !isAllFieldValid()
                        ? const Color.fromARGB(255, 255, 255, 255)
                        : const Color(0xFF3085FE),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: !isAllFieldValid()
                      ? null
                      : () {
                          context.read<AuthBloc>().add(AuthCheckEmailEvent(
                                email: emailController.text,
                              ));
                        },
                  child: Text(
                      state is AuthLoading
                          ? 'Loading...'
                          : widget.login == 'signup'
                              ? 'Sign Up'
                              : 'Sign In',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: isAllFieldValid()
                              ? const Color.fromARGB(255, 255, 255, 255)
                              : Colors.black)),
                ),
              );
            }),
            const SizedBox(height: 20),
            Container(
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: const Text(
                'Or continue with social account',
                style: TextStyle(color: Color(0xFFACAFB5), fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            Container(
              height: 60,
              width: double.infinity,
              alignment: Alignment.center,
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: const Color(0xFFADADAD)),
              ),
              child: const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image(image: AssetImage('assets/images/google.png')),
                  SizedBox(width: 10),
                  Text('Google'),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text('Don\'t have an account?'),
                  TextButton(
                    style: TextButton.styleFrom(
                      padding: EdgeInsets.zero,
                      textStyle: const TextStyle(
                        color: Color(0xFF3085FE),
                        fontSize: 14,
                      ),
                    ),
                    onPressed: () {
                      setState(() {
                        if (widget.login == 'signup') {
                          widget.login = 'signin';
                        } else {
                          widget.login = 'signup';
                        }
                      });
                    },
                    child: const Text(
                      'Sign Up',
                      style: TextStyle(fontSize: 14, color: Color(0xFF3085FE)),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      )),
    );
  }
}
