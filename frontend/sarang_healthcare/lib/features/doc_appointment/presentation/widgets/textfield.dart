import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    required this.textcontroller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.enablePrefixIcon = true,
    this.enabled = true,
    this.validator,
    this.keyboardType,
    this.maxLines, this.hintText,
  });

  final TextEditingController textcontroller;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool enablePrefixIcon;
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
        prefixIcon: enablePrefixIcon == true
            ? Icon(
                prefixIcon,
                size: 22,
              )
            : null,
        suffixIcon: enablePrefixIcon == false
            ? Icon(
                suffixIcon,
                size: 22,
              )
            : null,
      ),
    );
  }
}
