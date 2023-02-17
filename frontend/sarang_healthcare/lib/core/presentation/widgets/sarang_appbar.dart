import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';

class SarangAppbar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Widget? leading;
  const SarangAppbar({super.key, required this.title, this.leading});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      elevation: 0,
      leading: leading,
      title: Text(
        title,
        style: const TextStyle(
          fontSize: Sizes.s20,
          fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);
}
