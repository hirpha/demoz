import 'package:flutter/material.dart';

class TaxItem extends StatelessWidget {
  const TaxItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 255, 255, 255),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Date',
                    style: TextStyle(
                      fontSize: 12,
                      color: Color(0xFF101317),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    'Aug 28, 2024 - Sep 5, 2024',
                    style: TextStyle(
                      fontSize: 14,
                      color: Color(0xFF101317),
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    elevation: 0,
                    backgroundColor: const Color(0xFFFFC2B8),
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                  ),
                  onPressed: () {},
                  child: const Text('Pay now',
                      style: TextStyle(
                          color: Color(0xFFF7F7F7),
                          fontSize: 12,
                          fontWeight: FontWeight.bold))),
            ],
          ),
          const Divider(
            color: Color(0xFFC2B8B2),
          ),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Income Tax',
                      style: TextStyle(fontSize: 12, color: Color(0xFF101317))),
                  const SizedBox(height: 5),
                  Text('\$1000',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(
                            0xFF101317,
                          ),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text('Pension Tax',
                      style: TextStyle(fontSize: 12, color: Color(0xFF101317))),
                  Text('\$1000',
                      style: TextStyle(
                          fontSize: 14,
                          color: Color(
                            0xFF101317,
                          ),
                          fontWeight: FontWeight.bold)),
                ],
              ),
              Text(
                'August\n Tax on Due',
                style: TextStyle(
                    fontSize: 16,
                    color: Color(0xFFFF7F74),
                    fontWeight: FontWeight.bold),
              )
            ],
          ),
        ],
      ),
    );
  }
}
