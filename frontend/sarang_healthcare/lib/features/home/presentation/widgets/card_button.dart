import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';

class CardButton extends StatelessWidget {
  final String title;
  final IconData? icon;
  final void Function()? onPressed;
  const CardButton({
    super.key,
    this.onPressed,
    required this.title,
    required this.icon,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        CircleAvatar(
          maxRadius: 25,
          backgroundColor: AppColor.primary.withOpacity(0.1),
          child: IconButton(
            onPressed: onPressed,
            icon: Icon(
              icon,
              color: AppColor.primary,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Text(
          title,
          style: const TextStyle(
            color: AppColor.grey,
            fontSize: Sizes.s12,
          ),
        ),
      ],
    );
  }
}
