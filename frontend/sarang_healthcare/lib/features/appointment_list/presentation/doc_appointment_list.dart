import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/widgets/canvas_card.dart';
import '../../../core/presentation/widgets/connection_lost.dart';
import '../../../core/presentation/widgets/skeleton.dart';
import '../application/cubit/appointment_list_cubit.dart';
import 'widgets/widgets.dart';

class DocAppointmentList extends StatefulWidget {
  const DocAppointmentList({super.key});

  @override
  State<DocAppointmentList> createState() => _DocAppointmentListState();
}

class _DocAppointmentListState extends State<DocAppointmentList> {
  @override
  void initState() {
    super.initState();
    context.read<AppointmentListCubit>().getAppointmentListDetailForDoc();
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Appointments'),
            CanvasCard(
              child: BlocListener<AppointmentListCubit, AppointmentListState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loadFailure: (message) => context.showCustomSnackBar(
                        message: message, result: false),
                  );
                },
                child: BlocBuilder<AppointmentListCubit, AppointmentListState>(
                    builder: (context, state) {
                  return state.maybeWhen(
                    loadedNetwork: (appointmentListGroup) {
                      return AppointmentListGroupDoc(
                        scrollController: _scrollController,
                        appointmentListGroup: appointmentListGroup,
                      );
                    },
                    loading: () => ListView.separated(
                      physics: const BouncingScrollPhysics(),
                      itemCount: 6,
                      itemBuilder: (context, index) {
                        return Shimmer.fromColors(
                          baseColor: AppColor.shimmerBase,
                          highlightColor: AppColor.shimmerHighlight,
                          child: const Skeleton(
                            width: double.infinity,
                            height: 180,
                          ),
                        );
                      },
                      separatorBuilder: (context, index) {
                        return const SizedBox(
                          height: 18,
                        );
                      },
                    ),
                    loadFailure: (message) {
                      return ConnectionLost(
                        onRetry: () {
                          HapticFeedback.mediumImpact();
                          context
                              .read<AppointmentListCubit>()
                              .getAppointmentListDetailForDoc();
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
