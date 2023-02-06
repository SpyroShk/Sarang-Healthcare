part of 'signup_cubit.dart';

@freezed
class SignupState with _$SignupState {
  const factory SignupState.initial() = _Initial;
  const factory SignupState.loading() = _Loading;
  const factory SignupState.authenticated({required String message}) =
      _Authenticated;
  const factory SignupState.unauthenticated({required String message}) =
      _Unauthenticated;
}
