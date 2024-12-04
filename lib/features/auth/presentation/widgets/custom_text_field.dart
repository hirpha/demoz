import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final IconData? icon;
  final String label;
  final TextEditingController controller;
  final bool readOnly;
  final String? initialValue;
  const CustomTextField(
      {super.key,
      required this.hintText,
      required this.icon,
      required this.label,
      required this.controller,
      required this.readOnly,
      required this.initialValue});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Text(label,
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: TextFormField(
            readOnly: readOnly,
            initialValue: initialValue,
            decoration: InputDecoration(
              hintText: hintText,
              hintStyle: TextStyle(color: Colors.grey[400]),
              contentPadding: EdgeInsets.symmetric(vertical: 20),
              prefixIcon: Icon(icon, color: Colors.grey[400]),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide(color: Colors.grey[400]!),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
