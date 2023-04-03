import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';

class DocAppoList extends StatelessWidget {
  const DocAppoList({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [const SarangAppbar(title: 'Appointments')],
        ),
      ),
    );
  }
}
