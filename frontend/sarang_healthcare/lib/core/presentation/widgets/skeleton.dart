import 'package:flutter/material.dart';

class Skeleton extends StatelessWidget {
  const Skeleton({
    super.key,
    required this.width,
    this.height,
    this.spacingHeight,
  });
  final double width;
  final double? height;
  final double? spacingHeight;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Colors.white,
          ),
          width: width,
          height: height ?? 16,
        ),
        SizedBox(
          height: spacingHeight ?? 8,
        )
      ],
    );
  }
}
