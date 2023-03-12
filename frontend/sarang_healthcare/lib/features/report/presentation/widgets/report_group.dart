import 'package:flutter/material.dart';
import 'package:sarang_healthcare/features/report/domain/report_model.dart';

import '../../../../core/presentation/theme/sizes.dart';
import 'report_item.dart';

class ReportGroup extends StatelessWidget {
  final List<ReportModel> reportGroup;
  const ReportGroup({
    Key? key,
    required ScrollController scrollController,
    required this.reportGroup,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    return reportGroup.isEmpty
        ? const Center(
            child: Text(
              'No Reports Yet!',
              style: TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: Sizes.s32,
              ),
            ),
          )
        : ListView.separated(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.only(
              top: 30,
              bottom: 130,
            ),
            controller: _scrollController,
            itemBuilder: (context, index) {
              int reversedIndex = reportGroup.length - 1 - index;
              return ReportItem(
                report: reportGroup[reversedIndex],
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                height: 18,
              );
            },
            itemCount: reportGroup.length,
          );
  }
}
