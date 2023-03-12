import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/app_color.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';

import '../../domain/lab_testing_list_model.dart';

class CollectionType extends StatelessWidget {
  const CollectionType({super.key, required this.collection});
  final LabTestingListModel collection;

  @override
  Widget build(BuildContext context) {
    String dateStr = collection.collectionDate;
    String timeStr = collection.collectionTime;
    return Text(
      collectionTime(DateTime.parse('$dateStr $timeStr')),
      style: const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: Sizes.s16,
        color: AppColor.black,
      ),
    );
  }

  String collectionTime(DateTime d) {
    log(DateTime.now().toString());
    if (d.isBefore(DateTime.now())) {
      return 'Previous';
    } else {
      return 'Upcoming';
    }
  }
}
