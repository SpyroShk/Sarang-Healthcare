import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';

class Payment extends StatelessWidget {
  const Payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Payment'),
            CanvasCard(
              child: Column(
                children: [
                      const SizedBox(
                        height: 30,
                      ),

                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}