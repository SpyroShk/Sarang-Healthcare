import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

import '../theme/sizes.dart';

class PasswordField extends StatefulWidget {
  const PasswordField({
    Key? key,
    required this.passwordcontroller,
    this.onFieldSubmitted,
    required this.textInputAction,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController passwordcontroller;
  final Function(String value)? onFieldSubmitted;
  final TextInputAction textInputAction;
  final bool enabled;

  @override
  State<PasswordField> createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.passwordcontroller,
      obscureText: _isObscure,
      autofillHints: const [AutofillHints.password],
      textInputAction: widget.textInputAction,
      enabled: widget.enabled,
      // onEditingComplete: () => TextInput.finishAutofillContext(),
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password can't be empty.";
        } else if (value.length < 6) {
          return "The password must be at least 6 characters.";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Password',
        prefixIcon: const Icon(
          Icons.lock_outlined,
          size: 22,
        ),
        suffixIcon: IconButton(
          icon: Icon(
            _isObscure ? Icons.visibility_off : Icons.visibility,
          ),
          onPressed: (() {
            setState(() {
              _isObscure = !_isObscure;
            });
          }),
        ),
      ),
    );
  }
}
