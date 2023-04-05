import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../domain/user_detail.dart';
import '../../infrastructure/profile_repository.dart';

part 'profile_cubit.freezed.dart';
part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  final ProfileRepository _profileRepository;
  ProfileCubit({required ProfileRepository profileRepository})
      : _profileRepository = profileRepository,
        super(const ProfileState.initial());

  void getUserDetails() async {
    emit(const ProfileState.loading());
    final response = await _profileRepository.userDetail();
    response.fold(
      (profileFailure) async {
        String message = "";

        profileFailure.when(
          server: () =>
              message = "Server error occured. Please try again later.",
          storage: () => message = "Internal error occured.",
          network: () => message = "Network error occured.",
          client: (errMsg) => message = errMsg,
        );
        emit(ProfileState.notLoaded(message: message));
      },
      (profileSuccess) {
        profileSuccess.when(
          network: (apiData) => emit(
            ProfileState.loadedNetwork(apiData: apiData),
          ),
          cache: (cachedData) => emit(
            ProfileState.loadedCache(apiData: cachedData),
          ),
        );
      },
    );
  }

  UserDetail loadDetails() {
    UserDetail defaultDetails = const UserDetail(
      email: '',
      pk: 0,
      username: '',
      availableFrom: '',
      availableTo: '',
      category: '',
      firstName: '',
      image: '',
      isDoctor: false,
      lastName: '',
      qualifications: '',
    );
    final UserDetail userDetails = state.when(
      initial: () => throw StateError(
          'Cannot load details in initial state'), //PreferredDoctorState.initial(),
      loadedNetwork: (apiData) => apiData,
      loading: () => defaultDetails,
      notLoaded: (String message) =>
          throw StateError('Cannot load details in notLoaded state'),
      loadedCache: (apiData) => apiData,
    );
    final userDetail = userDetails;
    return userDetail;
  }
}
