import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onChange;
  final bool enabled;
  final Function? onTap;
  final bool isNumber;
  const TextFieldWidget(
      {super.key,
      required this.hintText,
      required this.controller,
      required this.onChange,
      this.enabled = true,
      this.onTap,
      this.isNumber = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      alignment: Alignment.centerLeft,
      height: 65,
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: const Color(0xFFADADAD)),
      ),
      child: GestureDetector(
        onTap: () => onTap!(context),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              hintText,
              style: TextStyle(color: Color(0xFFACAFB5), fontSize: 14),
            ),
            TextField(
              keyboardType: isNumber ? TextInputType.number : null,
              onTap: () => onTap!(context),
              controller: controller,
              onChanged: (value) {
                onChange(value);
              },
              enabled: enabled,
              decoration: InputDecoration.collapsed(
                hintText: '',
                hintStyle: TextStyle(color: Color(0xFFACAFB5), fontSize: 14),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
