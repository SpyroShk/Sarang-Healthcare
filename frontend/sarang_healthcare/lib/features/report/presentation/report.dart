import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';

import '../../../core/presentation/widgets/canvas_card.dart';
import '../../../core/presentation/widgets/connection_lost.dart';
import '../application/cubit/report_cubit.dart';
import 'widgets/widgets.dart';

class Report extends StatefulWidget {
  const Report({super.key});

  @override
  State<Report> createState() => _ReportState();
}

class _ReportState extends State<Report> {
  @override
  void initState() {
    super.initState();
    context.read<ReportCubit>().getReportDetail();
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Reports'),
            CanvasCard(
              child: BlocListener<ReportCubit, ReportState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loadFailure: (message) => context.showCustomSnackBar(
                        message: message, result: false),
                  );
                },
                child: BlocBuilder<ReportCubit, ReportState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                    loadedNetwork: (reportGroup) {
                      return ReportGroup(
                        scrollController: _scrollController,
                        reportGroup: reportGroup,
                      );
                    },
                    loading: () => const Center(
                      child: CircularProgressIndicator(),
                    ),
                    loadFailure: (message) {
                      return ConnectionLost(
                        onRetry: () {
                          context.read<ReportCubit>().getReportDetail();
                        },
                      );
                    },
                    orElse: () => const SizedBox.shrink(),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
