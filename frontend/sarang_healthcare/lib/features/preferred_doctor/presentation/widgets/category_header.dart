import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/app_color.dart';
import 'components/components.dart';

class CategoryHeader extends StatelessWidget {
  const CategoryHeader({
    super.key,
    required this.onCategoryChanged,
    required this.selectedCategory,
  });
  final Function onCategoryChanged;
  final String selectedCategory;

  @override
  Widget build(BuildContext context) {
    final categories = [
      "Paediatrician",
      "Orthopaedic",
      "ENT specialist",
      "Gynaecologist",
      "Psychiatrist",
      "Dermatologist"
    ];

    return Column(
      children: [
        Container(
          height: 42,
          // margin: const EdgeInsets.only(
          //   top: 22,
          // ),
          padding: const EdgeInsets.symmetric(horizontal: 2),
          decoration: BoxDecoration(
            color: AppColor.primary,
            borderRadius: BorderRadius.circular(12),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: categories
                    .map(
                      (category) => CategoryButton(
                        buttonText: category,
                        onPressed: onCategoryChanged,
                        selectedCategory: selectedCategory,
                      ),
                    )
                    .toList(),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
