import 'package:flutter/material.dart';

import 'payrolltable.dart';

class CalendarPage extends StatefulWidget {
  const CalendarPage({super.key});

  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 247, 247, 247),
      body: Column(
        children: [
          SizedBox(height: MediaQuery.of(context).padding.top + 20),
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Text('Calendar'),
          ),
          PayrollTable(),
        ],
      ),
    );
  }
}
