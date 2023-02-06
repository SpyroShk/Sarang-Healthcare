import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';

class SarangAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  const SarangAppbar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: Sizes.s20,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}