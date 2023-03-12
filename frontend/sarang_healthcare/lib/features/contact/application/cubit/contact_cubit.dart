import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/contact_failure.dart';
import '../../domain/contact_model.dart';
import '../../domain/contact_success.dart';
import '../../infrastructure/contact_repository.dart';

part 'contact_cubit.freezed.dart';
part 'contact_state.dart';

// class ContactCubit extends Cubit<ContactState> {
//   final ContactRepository _contactRepository;
//   ContactCubit({required ContactRepository contactRepository})
//       : _contactRepository = contactRepository,
//         super(const ContactState.initial());

//   void getContactModels() async {
//     emit(const ContactState.loading());
//     final response = await _contactRepository.contactModel();
//     response.fold(
//       (contactFailure) async {
//         String message = "";

//         contactFailure.when(
//           server: () =>
//               message = "Server error occured. Please try again later.",
//           storage: () => message = "Internal error occured.",
//           network: () => message = "Network error occured.",
//           client: (errMsg) => message = errMsg,
//         );
//         emit(ContactState.notLoaded(message: message));
//       },
//       (contactSuccess) {
//         contactSuccess.when(
//           network: (apiData) => emit(
//             ContactState.loadedNetwork(apiData: apiData),
//           ),
//           cache: (cachedData) => emit(
//             ContactState.loadedCache(apiData: cachedData),
//           ),
//         );
//       },
//     );
//   }
// }

class ContactCubit extends Cubit<ContactState> {
  final ContactRepository _contactRepository;
  int page = 1;

  ContactCubit({required ContactRepository contactRepository})
      : _contactRepository = contactRepository,
        super(const ContactState.initial());

  Future<void> getContactDetail() async {
    emit(const ContactState.loading());
    final response = await _contactRepository.contactModel();
    _handleContactResponse(response, []);
  }

  void _handleContactResponse(
    Either<ContactFailure, ContactSuccess> response,
    List<ContactModel> contactModel,
  ) {
    response.fold(
      (notificationFailure) {
        final message = _getErrorMessage(notificationFailure);
        emit(ContactState.notLoaded(message: message));
      },
      (notificationSuccess) {
        page++;
        final apiData = _getApiDataFromSuccess(notificationSuccess);
        emit(
            ContactState.loadedNetwork(apiData: [...contactModel, ...apiData]));
      },
    );
  }

  String _getErrorMessage(ContactFailure failure) {
    return failure.when(
      server: () => "Server error occurred. Please try again later.",
      storage: () => "Internal error occurred.",
      network: () => "Network error occurred.",
      client: (errMsg) => errMsg,
    );
  }

  List<ContactModel> _getApiDataFromSuccess(ContactSuccess success) {
    return success.when(
      network: (apiData) => apiData,
      cache: (apiData) => apiData,
    );
  }
}
