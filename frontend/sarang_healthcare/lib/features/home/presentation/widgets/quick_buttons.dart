import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';

class QuickButton extends StatelessWidget {
  final String title;
  final void Function()? onPressed;
  const QuickButton({super.key, this.onPressed, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      padding: const EdgeInsets.symmetric(horizontal: 2),
      decoration: const BoxDecoration(
        color: AppColor.canvas,
        borderRadius: BorderRadius.all(
          Radius.circular(30),
        ),
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(0, 0, 0, 0.1),
            spreadRadius: 4,
            blurRadius: 10,
          ),
        ],
      ),
      child: TextButton.icon(
        onPressed: onPressed,
        icon: const Icon(
          Icons.add,
          color: AppColor.primary,
        ),
        label: Text(
          title,
          style: const TextStyle(
            color: AppColor.grey,
            fontSize: Sizes.s16,
          ),
        ),
      ),
    );
  }
}
