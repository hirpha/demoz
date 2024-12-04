import 'package:flutter/material.dart';

import '../widgets/textfiled.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController companyNameController = TextEditingController();
  final TextEditingController addressController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController tinNumberController = TextEditingController();
  final TextEditingController numberOfEmployeesController =
      TextEditingController();
  final TextEditingController companyBankController = TextEditingController();
  final TextEditingController bankAccountNumberController =
      TextEditingController();

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
                controller: companyNameController,
                hintText: 'Company Name',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: addressController,
                hintText: 'Address of the company',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: phoneNumberController,
                hintText: 'Phone Number',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: tinNumberController,
                hintText: 'TIN Number',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: numberOfEmployeesController,
                hintText: 'Number of Employees',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: companyBankController,
                hintText: 'Company Bank',
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: bankAccountNumberController,
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
                  onPressed: () {
                    Navigator.pushNamed(context, '/home');
                  },
                  child: const Text('Submit Proposal',
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w400,
                          color: Colors.black)),
                ),
              ),
            ],
          ),
        ));
  }
}
