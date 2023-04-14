part of 'change_password_cubit.dart';

@freezed
class ChangePasswordState with _$ChangePasswordState {
  const factory ChangePasswordState.initial() = _Initial;
  const factory ChangePasswordState.loading() = _Loading;
  const factory ChangePasswordState.succeeded({required String message}) =
      _Succeeded;
  const factory ChangePasswordState.unsucceeded({required String message}) =
      _Unsucceeded;
}
