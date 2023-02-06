import '../../domain/login_detail.dart';
import 'login_detail_dto.dart';

class LoginMapper {
  static LoginDetailDto toDto(LoginDetail loginDetail) => LoginDetailDto(
        username: loginDetail.usernameEmail,
        password: loginDetail.password ?? "",
      );
}
