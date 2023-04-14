import 'package:flutter/material.dart';

class OldPasswordField extends StatefulWidget {
  const OldPasswordField({
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
  State<OldPasswordField> createState() => _OldPasswordFieldState();
}

class _OldPasswordFieldState extends State<OldPasswordField> {
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
          return "Old password can't be empty.";
        } else if (value.length < 6) {
          return "The old password must be at least 6 characters.";
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: 'Old Password',
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
