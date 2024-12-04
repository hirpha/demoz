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
          width: MediaQuery.of(context).size.width / 2 - 20,
          height: 100,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
            color: widget.backgroundColor,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: widget.borderColor),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                widget.title,
                style: const TextStyle(color: Color(0xFF101317)),
              ),
              Text(
                widget.amount,
                style: const TextStyle(color: Color(0xFF101317)),
              ),
            ],
          ),
        ));
  }
}
