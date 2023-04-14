import '../../domain/change_password_model.dart';

import 'change_password_model_dto.dart';

class ChangePasswordMapper {
  static ChangePasswordModelDto toDto(
          ChangePasswordModel changePasswordModel) =>
      ChangePasswordModelDto(
        old_password: changePasswordModel.old_password,
        new_password1: changePasswordModel.new_password1,
        new_password2: changePasswordModel.new_password2,
      );
}
