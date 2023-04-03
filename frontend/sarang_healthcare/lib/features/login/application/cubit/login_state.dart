part of 'login_cubit.dart';

@freezed
class LoginState with _$LoginState {
  const factory LoginState.initial() = _Initial;
  const factory LoginState.loading() = _Loading;
  const factory LoginState.authenticated() = _Authenticated;
  const factory LoginState.docAuthenticated() = _DocAuthenticated;
  const factory LoginState.unauthenticated({required String message}) =
      _Unauthenticated;
}
