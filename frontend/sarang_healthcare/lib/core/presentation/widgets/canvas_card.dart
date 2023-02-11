import 'package:flutter/material.dart';

import '../theme/app_color.dart';

class CanvasCard extends StatelessWidget {
  const CanvasCard({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
          color: AppColor.canvas,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: child,
      ),
    );
  }
}
