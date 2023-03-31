import 'package:flutter/material.dart';

import '../../domain/lab_tests_model.dart';
import 'widgets.dart';

class LabTestsList extends StatelessWidget {
  final List<LabTestsModel> labTestsList;
  final List<LabTestsModel> selectedLabTests;
  const LabTestsList({
    Key? key,
    required this.labTestsList,
    required ScrollController scrollController,
    required this.selectedLabTests,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 30, bottom: 30),
      controller: _scrollController,
      itemBuilder: (context, index) {
        return LabTestsListItem(
          labTests: labTestsList[index],
          selectedLabTests: selectedLabTests,
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 18,
        );
      },
      itemCount: labTestsList.length,
    );
  }
}
