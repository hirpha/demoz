import 'package:flutter/material.dart';

class TextFieldWidget extends StatelessWidget {
  final String hintText;
  final TextEditingController controller;
  final Function onChange;
  final bool enabled;
  final Function? onTap;
  final bool isNumber;
  final String? Function(String?)? validator;
  final String? errorText;

  const TextFieldWidget({
    super.key,
    required this.hintText,
    required this.controller,
    required this.onChange,
    this.enabled = true,
    this.onTap,
    this.isNumber = false,
    this.validator,
    this.errorText,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          alignment: Alignment.centerLeft,
          height: 65,
          padding: const EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(
              color: errorText != null ? Colors.red : const Color(0xFFADADAD),
            ),
          ),
          child: GestureDetector(
            onTap: onTap != null ? () => onTap!(context) : null,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  hintText,
                  style: TextStyle(
                    color: errorText != null
                        ? Colors.red
                        : const Color(0xFFACAFB5),
                    fontSize: 14,
                  ),
                ),
                TextFormField(
                  keyboardType: isNumber ? TextInputType.number : null,
                  controller: controller,
                  onChanged: (value) {
                    onChange(value);
                  },
                  enabled: enabled,
                  validator: validator,
                  decoration: InputDecoration.collapsed(
                    hintText: '',
                    hintStyle: const TextStyle(
                      color: Color(0xFFACAFB5),
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        if (errorText != null)
          Padding(
            padding: const EdgeInsets.only(left: 25, top: 5),
            child: Text(
              errorText!,
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
