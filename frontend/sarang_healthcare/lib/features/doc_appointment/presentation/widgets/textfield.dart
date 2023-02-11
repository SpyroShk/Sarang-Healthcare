import 'package:flutter/material.dart';

class Textfield extends StatelessWidget {
  const Textfield({
    super.key,
    // required this.textcontroller,
    required this.labelText,
    this.prefixIcon,
    this.suffixIcon,
    this.enablePrefixIcon = true,
  });

  // final TextEditingController textcontroller;
  final String labelText;
  final IconData? prefixIcon;
  final IconData? suffixIcon;
  final bool enablePrefixIcon;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      // controller: textcontroller,
      decoration: InputDecoration(
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
