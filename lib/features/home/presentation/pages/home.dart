import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../widgets/category.dart';
import '../widgets/domoz_card.dart';
import '../widgets/employe_composition.dart';
import '../widgets/tax_item.dart';
import '../widgets/tax_summery.dart';

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

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      appBar: AppBar(
        centerTitle: false,
        leading: SizedBox(),
        backgroundColor: const Color.fromARGB(255, 255, 255, 255),
        title: Text('Home'),
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.settings,
              size: 30,
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DomozCard(
                    title: 'Number of Employees',
                    amount: '2',
                    onTap: () {},
                    borderColor: Colors.grey,
                    backgroundColor: const Color(0xFF3085FE)),
                const SizedBox(width: 10),
                DomozCard(
                    title: 'Income Tax paid',
                    amount: '2000',
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
                    amount: '2000',
                    onTap: () {},
                    borderColor: Colors.grey,
                    backgroundColor: const Color(0xFF30BEB6)),
                const SizedBox(width: 10),
                DomozCard(
                    title: 'Employees Performance',
                    amount: '95%',
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
          const TaxItem(),
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
                      maxHeight: MediaQuery.of(context).size.height * 0.3,
                    ),
                    child: EmployeeComposition(),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: Container(
                    constraints: BoxConstraints(
                      minHeight: 150,
                      maxHeight: MediaQuery.of(context).size.height * 0.24,
                    ),
                    child: const TaxSummery(),
                  ),
                ),
              ],
            ),
          ),
        ],
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
                    height: 4.0,
                    width: 20.0,
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
                    height: 4.0,
                    width: 20.0,
                    color: Colors.blue,
                  ),
                const SizedBox(height: 10),
                SvgPicture.asset(
                  "assets/icons/profile.svg",
                  width: 20,
                  height: 20,
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
