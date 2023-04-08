import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/appointment_list/application/cubit/appointment_list_cubit.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/widgets/connection_lost.dart';
import '../../../core/presentation/widgets/skeleton.dart';
import 'widgets/widgets.dart';

class AppointmentList extends StatefulWidget {
  const AppointmentList({super.key});

  @override
  State<AppointmentList> createState() => _AppointmentListState();
}

class _AppointmentListState extends State<AppointmentList> {
  // @override
  // void initState() {
  //   super.initState();
  //   context.read<AppointmentListCubit>().getAppointmentListDetail();
  // }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return BlocListener<AppointmentListCubit, AppointmentListState>(
      listener: (context, state) {
        state.whenOrNull(
          loadFailure: (message) =>
              context.showCustomSnackBar(message: message, result: false),
        );
      },
      child: BlocBuilder<AppointmentListCubit, AppointmentListState>(
          builder: (context, state) {
        return state.maybeWhen(
          loadedNetwork: (appointmentListGroup) {
            return AppointmentListGroup(
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
                context.read<AppointmentListCubit>().getAppointmentListDetail();
              },
            );
          },
          orElse: () => const SizedBox.shrink(),
        );
      }),
    );
  }
}
