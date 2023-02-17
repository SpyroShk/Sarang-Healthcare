// import 'package:flutter/material.dart';
// import 'package:sarang_healthcare/features/preferred_doctor/presentation/widgets/components/persistent_header.dart';

// import 'widgets.dart';

// class CategorySection extends StatefulWidget {
//   const CategorySection({super.key});

//   @override
//   State<CategorySection> createState() => _CategorySectionState();
// }

// class _CategorySectionState extends State<CategorySection> {
//   CategoryType eventType = CategoryType.paediatrician;
//   String selectedCategory = "Paediatrician";

//   void onCategoryChanged(String category) {
//     switch (category) {
//       case ("Paediatrician"):
//         eventType = CategoryType.paediatrician;
//         break;
//       case ("Orthopaedic"):
//         eventType = CategoryType.orthopaedic;
//         break;
//       case ("ENT specialist"):
//         eventType = CategoryType.entSpecialist;
//         break;
//       case ("Gynaecologist"):
//         eventType = CategoryType.gynaecologist;
//         break;
//       case ("Psychiatrist"):
//         eventType = CategoryType.psychiatrist;
//         break;
//       case ("Dermatologist"):
//         eventType = CategoryType.dermatologist;
//         break;
//     }
//     selectedCategory = category;
//     setState(() {});
//   }

//   @override
//   Widget build(BuildContext context) {
//     return CustomScrollView(
//       slivers: [
//         SliverPersistentHeader(
//                   floating: true,
//                   pinned: true,
//                   delegate: PersitentHeader(maxHeight: 100,
//                     minHeight: 100,child: ),
//         )
//       ],
//     );
//   }
// }
