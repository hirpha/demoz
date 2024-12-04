import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(''),
        actions: [
          Text(
            "Add Employee",
            style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.symmetric(horizontal: 20),
            child: const Text.rich(
              TextSpan(
                text: 'Add New ',
                style: TextStyle(
                  fontSize: 26,
                  color: Color(0xFF101317),
                  fontWeight: FontWeight.bold,
                ),
                children: [
                  TextSpan(
                    text: 'Employee',
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
          SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            width: double.infinity,
            height: 50,
            child: Text(
                "Here you add your new employee and start calculating his tax and salary",
                style: TextStyle(color: Color(0xFFACAFB5), fontSize: 14)),
          ),
          SizedBox(height: 20),
          
        ],
      ),
    );
  }
}
