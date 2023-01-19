import 'package:flutter/material.dart';

import 'app_color.dart';

class GradientBg extends StatelessWidget {
  const GradientBg({super.key, this.child});
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          colors: [
            AppColor.primary,
            AppColor.secondary,
          ],
          begin: Alignment.topLeft,
        ),
      ),
      child: child,
    );
  }
}
