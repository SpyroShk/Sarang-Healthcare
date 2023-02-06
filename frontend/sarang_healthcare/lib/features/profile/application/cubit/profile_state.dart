part of 'profile_cubit.dart';

@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;
  const factory ProfileState.loading() = _Loading;
  const factory ProfileState.loadedNetwork({required UserDetail apiData}) =
      _LoadedNetwork;
  const factory ProfileState.loadedCache({required UserDetail apiData}) =
      _LoadedCache;
  const factory ProfileState.notLoaded({required String message}) = _NotLoaded;
}
