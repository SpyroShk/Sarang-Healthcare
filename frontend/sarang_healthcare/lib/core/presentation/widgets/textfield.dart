import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.textcontroller,
    required this.labelText,
    this.suffixIcon,
    this.disableSuffixIcon = true,
    this.enabled = true,
    this.validator,
    this.keyboardType,
    this.maxLines,
    this.hintText,
  });

  final TextEditingController textcontroller;
  final String labelText;
  final IconData? suffixIcon;
  final bool disableSuffixIcon;
  final bool enabled;
  final String? Function(String?)? validator;
  final TextInputType? keyboardType;
  final int? maxLines;
  final String? hintText;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLines: maxLines,
      textInputAction: TextInputAction.next,
      keyboardType: keyboardType,
      enabled: enabled,
      controller: textcontroller,
      validator: validator,
      decoration: InputDecoration(
        hintText: hintText,
        labelText: labelText,
        suffixIcon: disableSuffixIcon == false
            ? Icon(
                suffixIcon,
                size: 22,
              )
            : null,
      ),
    );
  }
}
