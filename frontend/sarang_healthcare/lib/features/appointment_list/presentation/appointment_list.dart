import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/appointment_list/application/cubit/appointment_list_cubit.dart';

import '../../../core/presentation/widgets/connection_lost.dart';
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
          loading: () => const Center(
            child: CircularProgressIndicator(),
          ),
          loadFailure: (message) {
            return ConnectionLost(
              onRetry: () {
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
