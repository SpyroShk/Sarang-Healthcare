part of 'contact_cubit.dart';

@freezed
class ContactState with _$ContactState {
  const factory ContactState.initial() = _Initial;
  const factory ContactState.loading() = _Loading;
  const factory ContactState.loadedNetwork({required List<ContactModel> apiData}) =
      _LoadedNetwork;
  const factory ContactState.loadedCache({required List<ContactModel> apiData}) =
      _LoadedCache;
  const factory ContactState.notLoaded({required String message}) = _NotLoaded;
}
