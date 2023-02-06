import '../../domain/signup_detail.dart';
import 'signup_detail_dto.dart';

class SignupMapper {
  static SignupDetailDto toDto(SignupDetail authDetail) => SignupDetailDto(
        username: authDetail.username,
        email: authDetail.email,
        password1: authDetail.password1 ?? "",
        password2: authDetail.password2 ?? "",
      );
}
