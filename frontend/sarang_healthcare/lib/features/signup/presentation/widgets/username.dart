import 'package:flutter/material.dart';

class UserNameField extends StatelessWidget {
  const UserNameField({
    Key? key,
    required this.userNameController,
    required this.textInputAction,
    this.onFieldSubmitted,
    this.enabled = true,
  }) : super(key: key);

  final TextEditingController userNameController;
  final TextInputAction textInputAction;
  final Function(String value)? onFieldSubmitted;
  final bool enabled;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: userNameController,
      enabled: enabled,
      textInputAction: textInputAction,
      onFieldSubmitted: onFieldSubmitted,
      autofillHints: const [AutofillHints.username],
      validator: (value) {
        if (value!.isEmpty) {
          return 'UserName can\'t be empty.';
        // } else if (!RegExp(
        //         r'^([a-zA-Z0-9_\-\.]+)@([a-zA-Z0-9_\-\.]+)\.([a-zA-Z\s]{2,5})$')
        //     .hasMatch(value)) {
        //   return 'Please enter a valid UserName.';
        }

        return null;
      },
      decoration: const InputDecoration(
        labelText: 'Username',
        prefixIcon: Icon(
          Icons.person_outline,
          size: 22,
        ),
      ),
    );
  }
}
