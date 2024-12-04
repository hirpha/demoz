import 'package:flutter/material.dart';

import '../widgets/category.dart';
import '../widgets/domoz_card.dart';
import '../widgets/employe_composition.dart';
import '../widgets/tax_item.dart';

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
                EmployeeComposition(),
                const SizedBox(width: 10),
                EmployeeComposition(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
