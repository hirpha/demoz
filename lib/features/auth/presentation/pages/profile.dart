import 'package:demoz/features/auth/data/repositories/auth_repo.dart';
import 'package:demoz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text_field.dart';
import 'dart:developer';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  final TextEditingController _companyEmailController = TextEditingController();
  final TextEditingController _companyPhoneController = TextEditingController();
  final TextEditingController _companyAddressController =
      TextEditingController();
  final TextEditingController _numberOfEmployeesController =
      TextEditingController();
  final TextEditingController _tinNumberController = TextEditingController();
  final TextEditingController _companyBankController = TextEditingController();
  final TextEditingController _companyBankAccountController =
      TextEditingController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
    getCompany();
  }

  Future<void> getCompany() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    BlocProvider.of<AuthBloc>(context).add(
        AuthGetCompanyEvent(companyId: prefs.getString('companyId') ?? ''));
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        body: BlocConsumer<AuthBloc, AuthState>(
          listener: (context, state) {
            if (state is AuthGetCompanyFailure) {
              // showSnackBar(context, 'Failed to get company');
            }
            if (state is AuthGetCompanySuccess) {
              _companyEmailController.text = state.company.email ?? '';
              _companyPhoneController.text = state.company.phoneNumber ?? '';
              _companyAddressController.text =
                  state.company.companyAddress ?? '';
              _numberOfEmployeesController.text =
                  state.company.numberOfEmployees.toString() ?? '';
              _tinNumberController.text = state.company.tinNumber ?? '';
              _companyBankController.text = state.company.companyBank ?? '';
              _companyBankAccountController.text =
                  state.company.bankAccountNumber ?? '';
              log(state.company.toString());
              setState(() {});
            }
          },
          builder: (context, state) {
            if (state is AuthGetCompanyLoading) {
              return const Center(
                child: CircularProgressIndicator(
                  color: Color(0xFF16C098),
                ),
              );
            }
            if (state is AuthGetCompanySuccess) {
              return Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: MediaQuery.of(context).size.height * 0.05),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Company \nProfile',
                          style: TextStyle(
                              fontSize: 28, fontWeight: FontWeight.bold),
                        ),
                        IconButton(
                            onPressed: () {
                              Navigator.pushNamed(context, '/settings');
                            },
                            icon: const Icon(Icons.settings)),
                      ],
                    ),
                  ),
                  Expanded(
                    child: SingleChildScrollView(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.27,
                            width: double.infinity,
                            margin: const EdgeInsets.symmetric(horizontal: 20),
                            child: Stack(
                              children: [
                                Container(
                                  height: 200,
                                  width: double.infinity,
                                  child:
                                      Image.asset('assets/images/profile.png'),
                                ),
                                Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.3,
                                  bottom: MediaQuery.of(context).size.height *
                                      0.055,
                                  child: CircleAvatar(
                                    radius: 20,
                                    backgroundColor:
                                        const Color.fromARGB(255, 233, 148, 19),
                                    child: IconButton(
                                      onPressed: () {},
                                      icon: const Icon(Icons.edit,
                                          color: Colors.white),
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right:
                                      MediaQuery.of(context).size.width * 0.3,
                                  bottom:
                                      MediaQuery.of(context).size.height * 0,
                                  child: Column(
                                    children: [
                                      const Text('Company Name',
                                          style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold)),
                                      Text(state.company.companyName ?? '',
                                          style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[600])),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            initialValue: state.company.email ?? '',
                            label: 'Company Email',
                            hintText: 'xxxx@gmail.com',
                            icon: Icons.email,
                            controller: _companyEmailController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            initialValue: state.company.phoneNumber ?? '',
                            label: 'Company Phone',
                            hintText: '0123456789',
                            icon: Icons.phone,
                            controller: _companyPhoneController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            initialValue: state.company.companyAddress ?? '',
                            label: 'Company Address',
                            hintText: '1234 Main St, Anytown, USA',
                            icon: Icons.location_on,
                            controller: _companyAddressController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            initialValue:
                                state.company.numberOfEmployees.toString() ??
                                    '',
                            label: 'Number of Employees',
                            hintText: '100',
                            icon: Icons.people,
                            controller: _numberOfEmployeesController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            initialValue: state.company.tinNumber ?? '',
                            label: 'Tin Number',
                            hintText: '1234567890',
                            icon: Icons.numbers,
                            controller: _tinNumberController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            initialValue: state.company.companyBank ?? '',
                            label: 'Company Bank',
                            hintText: 'Bank Name',
                            icon: Icons.account_balance,
                            controller: _companyBankController,
                            readOnly: true,
                          ),
                          const SizedBox(height: 10),
                          CustomTextField(
                            initialValue: state.company.bankAccountNumber ?? '',
                            label: 'Company Bank Account',
                            hintText: '1234567890',
                            icon: Icons.account_balance,
                            controller: _companyBankAccountController,
                            readOnly: true,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ));
  }
}
