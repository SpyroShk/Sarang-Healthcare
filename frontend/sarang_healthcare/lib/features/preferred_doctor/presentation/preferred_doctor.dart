import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/sarang_app.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';

class PreferredDoctor extends StatelessWidget {
  const PreferredDoctor({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Doctors'),
            CanvasCard(
              child: Column(
                children: [],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
