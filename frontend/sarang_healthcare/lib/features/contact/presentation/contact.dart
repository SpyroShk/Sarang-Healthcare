import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';

class Contact extends StatelessWidget {
  const Contact({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Contact'),
            CanvasCard(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset(
                      "assets/logo.png",
                      width: 300,
                    ),
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
