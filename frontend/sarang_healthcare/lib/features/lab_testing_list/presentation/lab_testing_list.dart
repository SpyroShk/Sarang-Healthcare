import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';

import '../../../core/presentation/widgets/connection_lost.dart';
import '../application/cubit/lab_testing_list_cubit.dart';
import 'widgets/lab_testing_list_group.dart';

class LabTestingList extends StatefulWidget {
  const LabTestingList({super.key});

  @override
  State<LabTestingList> createState() => _LabTestingListState();
}

class _LabTestingListState extends State<LabTestingList> {
  @override
  // void initState() {
  //   super.initState();
  //   context.read<LabTestingListCubit>().getLabTestingListDetail();
  // }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<LabTestingListCubit, LabTestingListState>(
      listener: (context, state) {
        state.whenOrNull(
          loadFailure: (message) =>
              context.showCustomSnackBar(message: message, result: false),
        );
      },
      child: BlocBuilder<LabTestingListCubit, LabTestingListState>(
          builder: (context, state) {
        return state.maybeWhen(
          loadedNetwork: (labTestingListGroup) {
            return LabTestingListGroup(
              scrollController: _scrollController,
              labTestingListGroup: labTestingListGroup,
            );
          },
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loadFailure: (message) {
            return ConnectionLost(
              onRetry: () {
                  HapticFeedback.mediumImpact();
                context.read<LabTestingListCubit>().getLabTestingListDetail();
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      }),
    );
  }
}
