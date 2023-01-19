import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';

class SarangButton extends StatelessWidget {
  const SarangButton({
    super.key,
    required this.onPressed,
    required this.isLoading,
    required this.label,
  });
  final VoidCallback onPressed;
  final bool isLoading;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: AppColor.black.withOpacity(0.15),
            offset: const Offset(0, 5),
            blurRadius: 15,
            spreadRadius: 2,
          ),
        ],
      ),
      child: MaterialButton(
        elevation: 2,
        highlightElevation: 0,
        // hoverElevation: 2,
        // focusElevation: 2,
        disabledElevation: 0,
        height: 45,
        minWidth: MediaQuery.of(context).size.width,
        color: AppColor.primary,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(30),
        ),
        onPressed: onPressed,
        child: isLoading
            ? Transform.scale(
                scale: 0.5,
                child: const CircularProgressIndicator(
                  color: Colors.white,
                ),
              )
            : Text(
                label,
                style: GoogleFonts.roboto(
                    fontSize: Sizes.s14,
                    color: Colors.white,
                    fontWeight: FontWeight.w500),
              ),
      ),
    );
  }
}
