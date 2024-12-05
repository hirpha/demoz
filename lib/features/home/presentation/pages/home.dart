import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../auth/presentation/bloc/auth_bloc.dart';
import '../../../auth/presentation/pages/profile.dart';
import '../../../employe/presentation/bloc/employe_bloc.dart';
import '../widgets/category.dart';
import '../widgets/domoz_card.dart';
import '../widgets/employe_composition.dart';
import '../widgets/tax_item.dart';
import '../widgets/tax_summery.dart';
import '../../../payroll/presentation/pages/calendar.dart';
import '../../../payroll/presentation/pages/payrolltable.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool activeButton = true;
  void changeActiveButton() {
    setState(() {
      activeButton = !activeButton;
    });
  }

  int _selectedIndex = 0;

  @override
  void initState() {
    super.initState();
    // SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    //   statusBarColor: Color.fromARGB(255, 255, 255, 255),
    //   statusBarIconBrightness: Brightness.dark,
    // ));
    getCompanyId().then((value) {
      context.read<EmployeBloc>().add(EmployeGetDashboard(value));
    });
  }

  getCompanyId() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    return sharedPreferences.getString('companyId');
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
    if (index == 0) {
      getCompanyId().then((value) {
        context.read<EmployeBloc>().add(EmployeGetDashboard(value));
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: _selectedIndex == 1
          ? PayrollTable()
          : _selectedIndex == 2
              ? ProfileScreen()
              : BlocConsumer<EmployeBloc, EmployeState>(
                  listener: (context, state) {},
                  builder: (context, state) {
                    if (state is EmployeGetDashboardSuccess) {
                      return Column(
                        children: [
                          SizedBox(
                              height: MediaQuery.of(context).padding.top + 20),
                          Container(
                            height: 60,
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: const Text(
                                    'Home',
                                    style: TextStyle(
                                      fontSize: 26,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {
                                    Navigator.pushNamed(context, '/settings');
                                  },
                                  icon: const Icon(Icons.settings),
                                ),
                              ],
                            ),
                          ),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DomozCard(
                                    title: 'Number of Employees',
                                    amount: state.dashboard.numberOfEmployees
                                        .toString(),
                                    onTap: () {},
                                    borderColor: Colors.grey,
                                    backgroundColor: const Color(0xFF3085FE)),
                                const SizedBox(width: 10),
                                DomozCard(
                                    title: 'Income Tax paid',
                                    amount: state.dashboard.incomeTax
                                        .toStringAsFixed(2),
                                    onTap: () {},
                                    borderColor: Colors.grey,
                                    backgroundColor: const Color(0xFFA3D139)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                DomozCard(
                                    title: 'Pension Tax paid',
                                    amount: state.dashboard.pensionTax
                                        .toStringAsFixed(2),
                                    onTap: () {},
                                    borderColor: Colors.grey,
                                    backgroundColor: const Color(0xFF30BEB6)),
                                const SizedBox(width: 10),
                                DomozCard(
                                    title: 'Employees Performance',
                                    amount:
                                        state.dashboard.performance.toString(),
                                    onTap: () {},
                                    borderColor: Colors.grey,
                                    backgroundColor: const Color(0xFFFF7F74)),
                              ],
                            ),
                          ),
                          const SizedBox(height: 10),
                          Category(
                            onPressed: changeActiveButton,
                            activeButton: activeButton,
                          ),
                          const SizedBox(height: 10),
                          TaxItem(
                            dashboard: state.dashboard,
                          ),
                          const SizedBox(height: 10),
                          Container(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 150,
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.3,
                                    ),
                                    child: EmployeeComposition(
                                      dashboard: state.dashboard,
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 10),
                                Expanded(
                                  child: Container(
                                    constraints: BoxConstraints(
                                      minHeight: 150,
                                      maxHeight:
                                          MediaQuery.of(context).size.height *
                                              0.24,
                                    ),
                                    child: const TaxSummery(),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    if (state is EmployeGetDashboardLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    return const SizedBox();
                  },
                ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
        backgroundColor: Colors.white,
        elevation: 8.0,
        items: [
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (_selectedIndex == 0)
                  Container(
                    height: 4.0,
                    width: 20.0,
                    color: Colors.blue,
                  ),
                const SizedBox(height: 10),
                SvgPicture.asset(
                  "assets/icons/home.svg",
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 0 ? Colors.blue : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (_selectedIndex == 1)
                  Container(
                    height: 6.0,
                    width: 25.0,
                    color: Colors.blue,
                  ),
                const SizedBox(height: 10),
                SvgPicture.asset(
                  "assets/icons/note.svg",
                  width: 20,
                  height: 20,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 1 ? Colors.blue : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Column(
              children: [
                if (_selectedIndex == 2)
                  Container(
                    height: 6.0,
                    width: 25.0,
                    color: Colors.blue,
                  ),
                const SizedBox(height: 10),
                SvgPicture.asset(
                  "assets/icons/profile.svg",
                  width: 25,
                  height: 25,
                  colorFilter: ColorFilter.mode(
                    _selectedIndex == 2 ? Colors.blue : Colors.black,
                    BlendMode.srcIn,
                  ),
                ),
              ],
            ),
            label: '',
          ),
        ],
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
