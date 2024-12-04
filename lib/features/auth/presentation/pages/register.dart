import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

import '../../data/models/company.dart';
import '../bloc/auth_bloc.dart';
import '../widgets/textfiled.dart';

class RegisterPage extends StatefulWidget {
  final String email;
  final String password;
  const RegisterPage({super.key, required this.email, required this.password});

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

  bool isAllFieldValid() {
    return companyNameController.text.isNotEmpty &&
        addressController.text.isNotEmpty &&
        phoneNumberController.text.isNotEmpty &&
        tinNumberController.text.isNotEmpty &&
        numberOfEmployeesController.text.isNotEmpty &&
        companyBankController.text.isNotEmpty &&
        bankAccountNumberController.text.isNotEmpty;
  }

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
                onChange: (value) {
                  setState(() {
                    isAllFieldValid();
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: addressController,
                hintText: 'Address of the company',
                onChange: (value) {
                  setState(() {
                    isAllFieldValid();
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: phoneNumberController,
                hintText: 'Phone Number',
                onChange: (value) {
                  setState(() {
                    isAllFieldValid();
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: tinNumberController,
                hintText: 'TIN Number',
                onChange: (value) {
                  setState(() {
                    isAllFieldValid();
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: numberOfEmployeesController,
                hintText: 'Number of Employees',
                onChange: (value) {
                  setState(() {
                    isAllFieldValid();
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: companyBankController,
                hintText: 'Company Bank',
                onChange: (value) {
                  setState(() {
                    isAllFieldValid();
                  });
                },
              ),
              const SizedBox(height: 20),
              TextFieldWidget(
                controller: bankAccountNumberController,
                hintText: 'Bank Account Number',
                onChange: (value) {
                  setState(() {
                    isAllFieldValid();
                  });
                },
              ),
              const SizedBox(height: 20),
              BlocConsumer<AuthBloc, AuthState>(
                listener: (context, state) {
                  if (state is AuthRegisterSuccess) {
                    Navigator.pushNamed(context, '/home');
                  }
                },
                builder: (context, state) {
                  return Container(
                    width: double.infinity,
                    height: 60,
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: !isAllFieldValid()
                            ? const Color.fromARGB(255, 218, 218, 218)
                            : const Color(0xFF3085FE),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      onPressed: !isAllFieldValid()
                          ? null
                          : () {
                              Company company = Company(
                                companyId: Uuid().v4(),
                                companyName: companyNameController.text,
                                companyAddress: addressController.text,
                                email: widget.email,
                                password: widget.password,
                                tinNumber: tinNumberController.text,
                                numberOfEmployees:
                                    int.parse(numberOfEmployeesController.text),
                                companyBank: companyBankController.text,
                                bankAccountNumber:
                                    bankAccountNumberController.text,
                              );
                              context
                                  .read<AuthBloc>()
                                  .add(AuthRegisterEvent(company: company));
                            },
                      child: Text(
                          state is AuthRegisterLoading
                              ? 'Loading...'
                              : 'Submit Proposal',
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.w400,
                              color: !isAllFieldValid()
                                  ? Colors.black
                                  : const Color.fromARGB(255, 255, 255, 255))),
                    ),
                  );
                },
              ),
            ],
          ),
        ));
  }
}
