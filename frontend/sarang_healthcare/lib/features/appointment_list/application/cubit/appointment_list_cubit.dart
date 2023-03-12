import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/appointment_list_failure.dart';
import '../../domain/appointment_list_model.dart';
import '../../domain/appointment_list_success.dart';
import '../../infrastructure/appointment_list_repository.dart';

part 'appointment_list_cubit.freezed.dart';
part 'appointment_list_state.dart';

class AppointmentListCubit extends Cubit<AppointmentListState> {
  final AppointmentListRepository _appointmentListRepository;

  AppointmentListCubit(
      {required AppointmentListRepository appointmentListRepository})
      : _appointmentListRepository = appointmentListRepository,
        super(const AppointmentListState.initial());

  Future<void> getAppointmentListDetail() async {
    emit(const AppointmentListState.loading());
    final response = await _appointmentListRepository.appointmentList();
    _handleAppointmentListResponse(response, []);
  }

  Future<void> getAppointmentListWithoutIdDetail() async {
    emit(const AppointmentListState.loading());
    final response =
        await _appointmentListRepository.appointmentListWithoutId();
    _handleAppointmentListResponse(response, []);
  }

  void _handleAppointmentListResponse(
    Either<AppointmentListFailure, AppointmentListSuccess> response,
    List<AppointmentListModel> appointmentLists,
  ) {
    response.fold(
      (appointmentListFailure) {
        final message = _getErrorMessage(appointmentListFailure);
        emit(AppointmentListState.loadFailure(message: message));
      },
      (appointmentListSuccess) {
        final apiData = _getApiDataFromSuccess(appointmentListSuccess);
        emit(AppointmentListState.loadedNetwork(
            apiData: [...appointmentLists, ...apiData]));
      },
    );
  }

  String _getErrorMessage(AppointmentListFailure failure) {
    return failure.when(
      server: () => "Server error occurred. Please try again later.",
      storage: () => "Internal error occurred.",
      network: () => "Network error occurred.",
      client: (errMsg) => errMsg,
    );
  }

  List<AppointmentListModel> _getApiDataFromSuccess(
      AppointmentListSuccess success) {
    return success.when(
      network: (apiData) => apiData,
    );
  }

  List<AppointmentListModel> getAppointmentsListWithoutIdDetail() {
    final List<AppointmentListModel> appointmentListWithoutId = state.maybeWhen(
        loadedNetwork: (apiData) => apiData, orElse: () => const []);
    return appointmentListWithoutId;
  }
}
