

import 'package:flutter/material.dart';

class RePasswordField extends StatefulWidget {
  final TextEditingController passwordController;
  final TextEditingController rePasswordController;
  final Function(String value)? onFieldSubmitted;
  final TextInputAction textInputAction;

  const RePasswordField({
    Key? key,
    required this.rePasswordController,
    this.onFieldSubmitted,
    required this.textInputAction,
    required this.passwordController,
  }) : super(key: key);

  @override
  State<RePasswordField> createState() => _RePasswordFieldState();
}

class _RePasswordFieldState extends State<RePasswordField> {
  bool _isObscure = true;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.rePasswordController,
      obscureText: _isObscure,
      autofillHints: const [AutofillHints.password],
      textInputAction: widget.textInputAction,
      // onEditingComplete: () => TextInput.finishAutofillContext(),
      onFieldSubmitted: widget.onFieldSubmitted,
      validator: (value) {
        if (value!.isEmpty) {
          return "Password can't be empty.";
        } else if (value.length < 6) {
          return "The password must be at least 6 characters.";
        } else if (value.toString() != widget.passwordController.text) {
          return "The passwords do not match.";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Re-Enter Password',
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
