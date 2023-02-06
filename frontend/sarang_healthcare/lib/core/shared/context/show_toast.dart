import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../presentation/theme/app_color.dart';
import '../../presentation/theme/sizes.dart';

extension ShowToast on BuildContext {
  void showCustomSnackBar({required String message, required bool result}) {
    ScaffoldMessenger.of(this).clearSnackBars();
    ScaffoldMessenger.of(this).showSnackBar(
      SnackBar(
        margin: const EdgeInsets.all(16),
        behavior: SnackBarBehavior.floating,
        elevation: 0,
        content: Row(
          children: [
            Icon(
              Icons.error,
              size: 12,
              color: result ? AppColor.primary : Colors.red.shade800,
            ),
            const SizedBox(
              width: 6,
            ),
            Expanded(
              child: Text(
                message,
                maxLines: 2,
                style: GoogleFonts.roboto(
                  fontSize: Sizes.s14,
                  color: result ? AppColor.primary : Colors.red.shade800,
                ),
              ),
            ),
          ],
        ),
        backgroundColor: result
            ? const Color.fromARGB(255, 194, 249, 231)
            : const Color(0xFFFEE2E2),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
    );
  }
}
