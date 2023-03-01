import 'dart:developer';

import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../domain/lab_tests_model.dart';
import 'component/component.dart';

class LabTestsListItem extends StatefulWidget {
  const LabTestsListItem({
    super.key,
    required this.labTests,
    required this.selectedLabTests,
  });
  final LabTestsModel labTests;
  final List<LabTestsModel> selectedLabTests;

  @override
  State<LabTestsListItem> createState() => _LabTestsListItemState();
}

class _LabTestsListItemState extends State<LabTestsListItem> {
  final testNameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    testNameController.text = widget.labTests.testName;
  }

  @override
  Widget build(BuildContext context) {
    final test = widget.labTests;
    final bool isChecked = widget.selectedLabTests.contains(test);
    return Container(
      padding: const EdgeInsets.all(30),
      height: 140,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.primary.withOpacity(0.1),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              LabTestsTitle(
                labTests: widget.labTests,
                controller: testNameController,
              ),
            ],
          ),
          Checkbox(
            value: isChecked,
            onChanged: (value) {
              setState(
                () {
                  if (value == true) {
                    widget.selectedLabTests.add(test);
                    log(widget.selectedLabTests
                        .toString()); // add the selected item to the list
                  } else {
                    widget.selectedLabTests.remove(
                        test); // remove the deselected item from the list
                  }
                },
              );
            },
          )
        ],
      ),
    );
  }
}
