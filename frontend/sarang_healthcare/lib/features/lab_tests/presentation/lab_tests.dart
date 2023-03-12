import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/route/app_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_button.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';

import '../../../core/presentation/widgets/connection_lost.dart';
import '../application/cubit/lab_tests_cubit.dart';
import '../domain/lab_tests_model.dart';
import 'widgets/widgets.dart';

class LabTests extends StatefulWidget {
  const LabTests({
    super.key,
  });

  @override
  State<LabTests> createState() => _LabTestsState();
}

class _LabTestsState extends State<LabTests> {
  @override
  void initState() {
    super.initState();
    context.read<LabTestsCubit>().getLabTestsDetail();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    final List<LabTestsModel> selectedLabTests = [];
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Select Tests'),
            CanvasCard(
              child: BlocListener<LabTestsCubit, LabTestsState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loadFailure: (message) => context.showCustomSnackBar(
                        message: message, result: false),
                  );
                },
                child: BlocBuilder<LabTestsCubit, LabTestsState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loadedNetwork: (labTestsList) {
                        return Column(
                          children: [
                            Expanded(
                              child: LabTestsList(
                                scrollController: _scrollController,
                                labTestsList: labTestsList,
                                selectedLabTests: selectedLabTests,
                              ),
                            ),
                            SarangButton(
                              onPressed: () => context.push(
                                  AppRoutes.labtesting,
                                  extra: selectedLabTests),
                              isLoading: false,
                              label: 'Done',
                            ),
                            const SizedBox(
                              height: 30,
                            )
                          ],
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loadFailure: (message) {
                        return ConnectionLost(
                          onRetry: () {
                            context.read<LabTestsCubit>().getLabTestsDetail();
                          },
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}