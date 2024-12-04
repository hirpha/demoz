import 'package:flutter/material.dart';

class DomozCard extends StatefulWidget {
  final String title;
  final String amount;
  final Function() onTap;
  final Color borderColor;
  final Color backgroundColor;
  const DomozCard({
    super.key,
    required this.title,
    required this.amount,
    required this.onTap,
    required this.borderColor,
    required this.backgroundColor,
  });

  @override
  State<DomozCard> createState() => _DomozCardState();
}

class _DomozCardState extends State<DomozCard> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: widget.onTap,
        child: Container(
          width: MediaQuery.of(context).size.width / 2 - 30,
          height: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.backgroundColor.withOpacity(0.05),
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: widget.backgroundColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(
                    color: Color(0xFF101317),
                    fontSize: 16,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                widget.amount,
                style: TextStyle(
                    color: widget.backgroundColor,
                    fontSize: 20,
                    fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ));
  }
}
