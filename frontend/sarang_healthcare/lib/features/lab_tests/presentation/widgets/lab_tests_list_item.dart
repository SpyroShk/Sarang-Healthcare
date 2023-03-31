import 'dart:developer';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/widgets/widgets.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
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
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return Stack(
              children: [
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: AppColor.canvas.withOpacity(0),
                  ),
                ),
                AlertDialog(
                  title: Text(
                    widget.labTests.testName,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: const TextStyle(
                      fontSize: Sizes.s20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  content: SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Text(widget.labTests.testDescription)),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  actions: [
                    SarangButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      isLoading: false,
                      label: 'Close',
                    ),
                  ],
                ),
              ],
            );
          },
        );
      },
      child: Container(
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
            Transform.scale(
              scale: 1.3,
              child: Checkbox(
                value: isChecked,
                activeColor: AppColor.primary,
                shape: const CircleBorder(),
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
              ),
            )
          ],
        ),
      ),
    );
  }
}
