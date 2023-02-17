import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';

import '../../../../../core/presentation/theme/app_color.dart';

class CategoryButton extends StatelessWidget {
  const CategoryButton(
      {super.key,
      required this.buttonText,
      required this.onPressed,
      required this.selectedCategory});

  final String buttonText;
  final Function onPressed;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    final isSelected = selectedCategory == buttonText;
    final screenWidth = MediaQuery.of(context).size.width;

    return MaterialButton(
      onPressed: () => onPressed(buttonText),
      minWidth: 40,
      elevation: 0,
      color: isSelected ? AppColor.canvas : AppColor.primary,
      padding: EdgeInsets.symmetric(
          vertical: 8, horizontal: screenWidth < 350 ? 14 : 16), //16
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      focusColor: Colors.black,
      child: Text(
        buttonText,
        style: Theme.of(context).textTheme.headline6!.copyWith(
            color: isSelected ? AppColor.primary : AppColor.canvas,
            fontSize: Sizes.s14,
            fontWeight: FontWeight.w800),
      ),
    );
  }
}
