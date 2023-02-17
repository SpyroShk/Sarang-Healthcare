import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/preferred_doctor_failure.dart';
import '../../domain/preferred_doctor_model.dart';
import '../../domain/preferred_doctor_success.dart';
import '../../infrastructure/preferred_doctor_repository.dart';

part 'preferred_doctor_cubit.freezed.dart';
part 'preferred_doctor_state.dart';

class PreferredDoctorCubit extends Cubit<PreferredDoctorState> {
  final PreferredDoctorRepository _preferredDoctorRepository;
  int page = 1;

  PreferredDoctorCubit(
      {required PreferredDoctorRepository preferredDoctorRepository})
      : _preferredDoctorRepository = preferredDoctorRepository,
        super(const PreferredDoctorState.initial());

  Future<void> getPreferredDoctorDetail() async {
    emit(const PreferredDoctorState.loading());
    final response = await _preferredDoctorRepository.preferredDoctor();
    _handlePreferredDoctorResponse(response, []);
  }

  void _handlePreferredDoctorResponse(
    Either<PreferredDoctorFailure, PreferredDoctorSuccess> response,
    List<PreferredDoctorModel> preferredDoctors,
  ) {
    response.fold(
      (preferredDoctorFailure) {
        final message = _getErrorMessage(preferredDoctorFailure);
        emit(PreferredDoctorState.loadFailure(message: message));
      },
      (preferredDoctorSuccess) {
        final apiData = _getApiDataFromSuccess(preferredDoctorSuccess);
        emit(PreferredDoctorState.loadedNetwork(
            apiData: [...preferredDoctors, ...apiData]));
      },
    );
  }

  String _getErrorMessage(PreferredDoctorFailure failure) {
    return failure.when(
      server: () => "Server error occurred. Please try again later.",
      storage: () => "Internal error occurred.",
      network: () => "Network error occurred.",
      client: (errMsg) => errMsg,
    );
  }

  List<PreferredDoctorModel> _getApiDataFromSuccess(
      PreferredDoctorSuccess success) {
    return success.when(
      network: (apiData) => apiData,
    );
  }

  List<PreferredDoctorModel> _getPreferredDoctorsFromState() {
    return state.whenOrNull(
          loadedNetwork: (apiData) => apiData,
        ) ??
        [];
  }

  List<PreferredDoctorModel> changeDoctor(String doctorCategory) {
    final List<PreferredDoctorModel> preferredDoctors = state.when(
      initial: () => const [], //PreferredDoctorState.initial(),
      loadedNetwork: (apiData) => apiData,
      loadFailure: (String message) => const [],
      loading: () => const [],
      notLoaded: (String message) => const [],
    );
    final filteredDoctor = preferredDoctors
        .where((doctor) => doctor.category == doctorCategory)
        .toList();
    return filteredDoctor;
  }

  // bool changeDoctor({required String selectedCategory}){
  //   return state.maybeWhen(
  //     loadedNetwork:(apiData)=> apiData.any(
  //       (category) {
  //         switch(selectedCategory){
  //           case ("Paediatrician"):
  //             return category.category && category.isSelected;

  //           case ("Orthopaedic"):
  //             return category.category
  //         }
  //       },
  //     ),orElse: ()=>false,
  //   );
  // }
}
