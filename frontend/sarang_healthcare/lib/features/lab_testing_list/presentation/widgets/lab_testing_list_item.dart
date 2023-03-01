import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarang_healthcare/features/lab_tests/infrastructure/dtos/lab_tests_dto.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../domain/lab_testing_list_model.dart';

class LabTestingListItem extends StatelessWidget {
  const LabTestingListItem({super.key, required this.labTestingList});
  final LabTestingListModel labTestingList;

  @override
  Widget build(BuildContext context) {
    String dateStr = labTestingList.collectionDate;
    String timeStr = labTestingList.collectionTime;


    List<LabTestsDto> parseLabTests(String input) {
      // Remove the brackets from the input string
      input = input
          .replaceAll('[', '')
          .replaceAll(']', '')
          .replaceAll(', L', ', LL');

      // Split the input string into individual LabTestsModel strings
      List<String> labTestsModelStrings = input.split(', L');

      // Create an empty list to store LabTestsDto objects
      List<LabTestsDto> labTests = [];

      // Parse each LabTestsModel string into a LabTestsDto object
      labTestsModelStrings.forEach((modelString) {
        // Extract the fields from the LabTestsModel string using regular expressions
        final idMatch = RegExp(r'id:\s*(\d+)').firstMatch(modelString);
        final id = idMatch != null ? int.parse(idMatch.group(1)!) : 0;
        final testName = RegExp(r'testName:\s*([^,]+)')
                .firstMatch(modelString)
                ?.group(1)
                ?.trim() ??
            "";
        final priceMatch = RegExp(r'price:\s*([\d.]+)')
                .firstMatch(modelString)
                ?.group(1)
                ?.trim() ??
            "";
        final price = priceMatch;

        // Create a LabTestsDto object and add it to the list
        labTests.add(LabTestsDto(id: id, testName: testName, price: price));
      });

      return labTests;
    }

    log(parseLabTests(labTestingList.testList).toString());

    final collectionfilter =
        DateTime.parse('$dateStr $timeStr').isBefore(DateTime.now());
    return Container(
      foregroundDecoration: (collectionfilter)
          ? BoxDecoration(
              color: Colors.grey,
              borderRadius: BorderRadius.circular(30),
              backgroundBlendMode: BlendMode.saturation,
            )
          : null,
      height: 250,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.appointmentCard,
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: //labTestsList.length,
                          parseLabTests(labTestingList.testList).length, //
                      itemBuilder: (BuildContext context, int index) {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              overflow: TextOverflow.ellipsis,
                              // labTestsList[index].testName,
                              parseLabTests(labTestingList.testList)[index]
                                  .testName,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s20,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              parseLabTests(labTestingList.testList)[index]
                                  .price
                                  .toString(),
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: AppColor.primary.withOpacity(0.3),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.calendar_month_outlined,
                                size: 20,
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              overflow: TextOverflow.ellipsis,
                              labTestingList.collectionDate,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                        Row(
                          children: [
                            Container(
                              padding: EdgeInsets.zero,
                              child: const Icon(
                                Icons.access_time_outlined,
                                size: 20,
                                color: AppColor.primary,
                              ),
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                              labTestingList.collectionTime,
                              style: GoogleFonts.inter(
                                fontSize: Sizes.s14,
                                fontWeight: FontWeight.bold,
                                color: AppColor.secondary,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Text(
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        'Patient ${labTestingList.patientName}',
                        style: GoogleFonts.inter(
                          fontSize: Sizes.s16,
                          fontWeight: FontWeight.bold,
                          color: AppColor.secondary,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// labTestingList.testList.toList()?.map((test) => test.testName).toString() ?? 'Tests';
