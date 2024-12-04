import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final VoidCallback onPressed;
  final bool activeButton;
  const Category(
      {super.key, required this.onPressed, required this.activeButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 232, 232, 232),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 70,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: activeButton
                      ? const Color.fromARGB(255, 18, 76, 212)
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Upcoming',
                    style: TextStyle(
                        color: activeButton ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold))),
          ),
          const SizedBox(width: 10),
          SizedBox(
            height: 70,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  backgroundColor: !activeButton
                      ? const Color.fromARGB(255, 18, 76, 212)
                      : Colors.grey,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: const Text('Past')),
          ),
        ],
      ),
    );
  }
}
