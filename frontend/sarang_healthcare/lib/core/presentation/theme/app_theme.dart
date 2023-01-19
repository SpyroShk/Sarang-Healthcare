import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'app_color.dart';
import 'sizes.dart';

class AppTheme {
  static ThemeData theme(BuildContext context) {
    return ThemeData(
      appBarTheme: _appbarTheme(),
      fontFamily: GoogleFonts.poppins().fontFamily,
      canvasColor: AppColor.canvas,
      inputDecorationTheme: inputDecorationTheme,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: AppColor.canvas,
        selectedItemColor: AppColor.primary,
        unselectedItemColor: AppColor.grey,
        selectedLabelStyle: GoogleFonts.poppins(
          color: Colors.black,
          fontWeight: FontWeight.w500,
        ),
        unselectedLabelStyle: GoogleFonts.poppins(
          fontWeight: FontWeight.w500,
        ),
      ),
      textTheme: _textTheme(),
      textSelectionTheme: _textSelectionTheme(),
      pageTransitionsTheme: const PageTransitionsTheme(
        builders: {
          TargetPlatform.android: CupertinoPageTransitionsBuilder(),
          TargetPlatform.iOS: CupertinoPageTransitionsBuilder(),
        },
      ),
    );
  }

  static TextSelectionThemeData _textSelectionTheme() {
    return TextSelectionThemeData(
      cursorColor: AppColor.primary,
      selectionColor: AppColor.primary.withOpacity(0.5),
      selectionHandleColor: AppColor.primary,
    );
  }

  //requireddd
  static TextTheme _textTheme() => TextTheme(
        headline6: GoogleFonts.poppins(fontSize: Sizes.s12),
      );

  static AppBarTheme _appbarTheme() => AppBarTheme(
        elevation: 1,
        backgroundColor: AppColor.canvas,
        titleTextStyle: GoogleFonts.poppins(
          color: AppColor.black,
          fontSize: Sizes.s20,
        ),
        iconTheme: const IconThemeData(
          color: AppColor.black,
        ),
      );

  static get inputDecorationTheme => InputDecorationTheme(
        suffixIconColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.error)) {
              return AppColor.error;
            }

            if (states.contains(MaterialState.focused)) {
              return AppColor.primary;
            }

            if (states.contains(MaterialState.disabled)) {
              return Colors.grey.shade300;
            }

            return AppColor.grey;
          },
        ),
        prefixIconColor: MaterialStateColor.resolveWith(
          (states) {
            if (states.contains(MaterialState.error)) {
              return AppColor.error;
            }

            if (states.contains(MaterialState.focused)) {
              return AppColor.primary;
            }

            if (states.contains(MaterialState.disabled)) {
              return Colors.grey.shade300;
            }

            return AppColor.grey;
          },
        ),
        floatingLabelStyle: MaterialStateTextStyle.resolveWith((states) {
          TextStyle style = const TextStyle();

          if (states.contains(MaterialState.error)) {
            return style.copyWith(color: AppColor.error);
          }
          if (states.contains(MaterialState.focused)) {
            return style.copyWith(color: AppColor.primary);
          }

          if (states.contains(MaterialState.disabled)) {
            return style.copyWith(color: Colors.grey.shade300);
          }

          return style.copyWith(color: AppColor.grey);
        }),
        labelStyle: MaterialStateTextStyle.resolveWith((states) {
          TextStyle style = const TextStyle();

          if (states.contains(MaterialState.error)) {
            return style.copyWith(color: AppColor.error);
          }
          if (states.contains(MaterialState.focused)) {
            return style.copyWith(color: AppColor.primary);
          }

          if (states.contains(MaterialState.disabled)) {
            return style.copyWith(color: Colors.grey.shade300);
          }

          return style.copyWith(color: AppColor.grey);
        }),
        contentPadding:
            const EdgeInsets.symmetric(vertical: 18.0, horizontal: 16),
        border: MaterialStateOutlineInputBorder.resolveWith(
          (states) {
            OutlineInputBorder inputBorder = const OutlineInputBorder(
              borderRadius: BorderRadius.all(Radius.circular(12)),
              borderSide: BorderSide(color: AppColor.grey),
            );

            if (states.contains(MaterialState.error)) {
              return inputBorder.copyWith(
                borderSide: const BorderSide(color: AppColor.error),
              );
            }

            if (states.contains(MaterialState.focused)) {
              return inputBorder.copyWith(
                borderSide: const BorderSide(color: AppColor.primary),
              );
            }

            if (states.contains(MaterialState.disabled)) {
              return inputBorder.copyWith(
                borderSide: BorderSide(color: Colors.grey.shade300),
              );
            }

            return inputBorder;
          },
        ),
      );
}
