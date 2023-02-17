import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';

class DataTimeSelector extends StatelessWidget {
  const DataTimeSelector({
    super.key,
    required this.text,
    required this.onPressed,
    required this.icon, this.width,
  });
  final String text;
  final void Function() onPressed;
  final IconData icon;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        height: 58,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: AppColor.grey,
            width: 1,
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(fontSize: Sizes.s16, color: AppColor.grey),
            ),
            Icon(
              icon,
              size: 22,
              color: AppColor.grey,
            ),
          ],
        ),
      ),
    );
  }
}
