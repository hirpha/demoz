import 'package:demoz/features/auth/data/repositories/auth_repo.dart';
import 'package:demoz/features/auth/presentation/bloc/auth_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../widgets/custom_text_field.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

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
        body: BlocBuilder<AuthBloc, AuthState>(
          builder: (context, state) {
            if (state is AuthGetCompanySuccess) {
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height * 0.08),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Company \nProfile',
                            style: TextStyle(
                                fontSize: 28, fontWeight: FontWeight.bold),
                          ),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(Icons.settings)),
                        ],
                      ),
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.24,
                      width: double.infinity,
                      margin: const EdgeInsets.symmetric(horizontal: 20),
                      child: Stack(
                        children: [
                          Container(
                            height: 200,
                            width: double.infinity,
                            child: Image.asset('assets/images/profile.png'),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * 0.3,
                            bottom: MediaQuery.of(context).size.height * 0.048,
                            child: CircleAvatar(
                              radius: 20,
                              backgroundColor:
                                  const Color.fromARGB(255, 233, 148, 19),
                              child: IconButton(
                                onPressed: () {},
                                icon:
                                    const Icon(Icons.edit, color: Colors.white),
                              ),
                            ),
                          ),
                          Positioned(
                            right: MediaQuery.of(context).size.width * 0.3,
                            bottom: MediaQuery.of(context).size.height * 0,
                            child: Column(
                              children: [
                                Text('Company Name',
                                    style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: FontWeight.bold)),
                                Text('Company Address',
                                    style: TextStyle(
                                        fontSize: 14, color: Colors.grey[600])),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Company Email',
                      hintText: 'xxxx@gmail.com',
                      icon: Icons.email,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Company Phone',
                      hintText: '0123456789',
                      icon: Icons.phone,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Company Address',
                      hintText: '1234 Main St, Anytown, USA',
                      icon: Icons.location_on,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Number of Employees',
                      hintText: '100',
                      icon: Icons.people,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Tin Number',
                      hintText: '1234567890',
                      icon: Icons.numbers,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Company Bank',
                      hintText: 'Bank Name',
                      icon: Icons.account_balance,
                      controller: TextEditingController(),
                    ),
                    SizedBox(height: 10),
                    CustomTextField(
                      label: 'Company Bank Account',
                      hintText: '1234567890',
                      icon: Icons.account_balance,
                      controller: TextEditingController(),
                    ),
                  ],
                ),
              );
            }
            return const SizedBox();
          },
        ));
  }
}
