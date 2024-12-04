import 'package:flutter/material.dart';

import '../widgets/domoz_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 255, 255, 255),
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
            padding: const EdgeInsets.all(10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                DomozCard(
                    title: 'title',
                    amount: 'description',
                    onTap: () {},
                    borderColor: Colors.grey,
                    backgroundColor: Colors.white),
                const SizedBox(width: 10),
                DomozCard(
                    title: 'title',
                    amount: 'description',
                    onTap: () {},
                    borderColor: Colors.grey,
                    backgroundColor: Colors.white),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
