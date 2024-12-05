import 'package:flutter/material.dart';

class TaxSummery extends StatefulWidget {
  const TaxSummery({super.key});

  @override
  State<TaxSummery> createState() => _TaxSummeryState();
}

class _TaxSummeryState extends State<TaxSummery> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            blurRadius: 8.0,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Tax Summery",
            style: TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Text(
            "9,349.85 etb ",
            style: TextStyle(
                fontSize: 24.0,
                color: Colors.black,
                fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 16.0),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                "49.98 %",
                style: TextStyle(
                    fontSize: 16.0,
                    color: Colors.green,
                    fontWeight: FontWeight.bold),
              ),
              Icon(Icons.arrow_drop_up, size: 30.0, color: Colors.green),
            ],
          ),
        ],
      ),
    );
  }
}
