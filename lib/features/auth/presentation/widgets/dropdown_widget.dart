import 'package:flutter/material.dart';

class DropdownWidget extends StatefulWidget {
  final String hintText;
  final TextEditingController controller;
  final String? errorText;
  final Function(String)? onChange;

  const DropdownWidget({
    Key? key,
    required this.hintText,
    required this.controller,
    this.errorText,
    this.onChange,
  }) : super(key: key);

  @override
  State<DropdownWidget> createState() => _DropdownWidgetState();
}

class _DropdownWidgetState extends State<DropdownWidget> {
  String? selectedValue;
  final List<String> genderItems = ['Male', 'Female'];

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          height: 60,
          margin: const EdgeInsets.symmetric(horizontal: 20),
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(
              color: widget.errorText != null
                  ? Colors.red
                  : const Color(0xFFE5E7EB),
            ),
          ),
          child: DropdownButtonHideUnderline(
            child: DropdownButton<String>(
              hint: Text(
                widget.hintText,
                style: TextStyle(
                  fontSize: 14,
                  color: widget.errorText != null
                      ? Colors.red
                      : const Color(0xFFACAFB5),
                ),
              ),
              value: selectedValue,
              isExpanded: true,
              items: genderItems.map((String item) {
                return DropdownMenuItem(
                  value: item,
                  child: Text(
                    item,
                    style: const TextStyle(
                      fontSize: 14,
                      color: Colors.black,
                    ),
                  ),
                );
              }).toList(),
              onChanged: (String? value) {
                setState(() {
                  selectedValue = value;
                  widget.controller.text = value ?? '';
                  if (widget.onChange != null) {
                    widget.onChange!(value ?? '');
                  }
                });
              },
            ),
          ),
        ),
        if (widget.errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 5),
            child: Text(
              widget.errorText!,
              style: const TextStyle(
                color: Colors.red,
                fontSize: 12,
              ),
            ),
          ),
      ],
    );
  }
}
