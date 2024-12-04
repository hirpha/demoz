import 'package:flutter/material.dart';

class Category extends StatelessWidget {
  final VoidCallback onPressed;
  final bool activeButton;
  const Category(
      {super.key, required this.onPressed, required this.activeButton});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 53,
      margin: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 250, 250, 250),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: 55,
            child: ElevatedButton(
                onPressed: onPressed,
                style: ElevatedButton.styleFrom(
                  elevation: 0,
                  backgroundColor: activeButton
                      ? const Color(0xFF3085FE)
                      : Colors.transparent,
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
                  elevation: 0,
                  backgroundColor: !activeButton
                      ? const Color(0xFF3085FE)
                      : Colors.transparent,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                ),
                child: Text('Past',
                    style: TextStyle(
                        color: !activeButton ? Colors.white : Colors.black,
                        fontWeight: FontWeight.bold))),
          ),
        ],
      ),
    );
  }
}
