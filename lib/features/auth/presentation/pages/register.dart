import 'package:flutter/material.dart';

import '../widgets/textfiled.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(255, 255, 255, 255),
          leading: IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(Icons.arrow_back),
          ),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                width: double.infinity,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text.rich(
                  TextSpan(
                    text: 'Register your company\n',
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
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: const Text(
                  'Register your company to continue',
                  style: TextStyle(color: Color(0xFFACAFB5), fontSize: 14),
                ),
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Company Name',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Address of the company',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Phone Number',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Number of Employees',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Company Bank',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: TextEditingController(),
                hintText: 'Bank Account Number',
              ),
              const SizedBox(height: 20),
              Container(
                width: double.infinity,
                height: 60,
                margin: const EdgeInsets.symmetric(horizontal: 20),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color.fromARGB(255, 218, 218, 218),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                  onPressed: () {},
                  child: const Text('Submit Proposal'),
                ),
              ),
            ],
          ),
        ));
  }
}
