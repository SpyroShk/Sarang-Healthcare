import 'package:flutter/material.dart';

import '../../domain/lab_testing_list_model.dart';
import 'collection_type.dart';
import 'lab_testing_list_item.dart';

class LabTestingListGroup extends StatelessWidget {
  final List<LabTestingListModel> labTestingListGroup;
  final ScrollController _scrollController;
  
  const LabTestingListGroup({Key? key,
    required ScrollController scrollController,
    required this.labTestingListGroup,
  })  : _scrollController = scrollController,
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(
        top: 30,
        bottom: 130,
      ),
      controller: _scrollController,
      itemBuilder: (context, index) {
        int reversedIndex = labTestingListGroup.length - 1 - index;
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            index == 0
                ? Column(
                    children: [
                      Container(
                        margin: const EdgeInsets.only(left: 15),
                        child: CollectionType(
                            collection: labTestingListGroup[reversedIndex]),
                      ),
                      const SizedBox(
                        height: 10,
                      )
                    ],
                  )
                : const SizedBox(
                    height: 7,
                  ),
            LabTestingListItem(
              labTestingList: labTestingListGroup[reversedIndex],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 18,
        );
      },
      itemCount: labTestingListGroup.length,
    );
  }
}