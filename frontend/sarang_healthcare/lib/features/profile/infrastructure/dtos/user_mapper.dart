import '../../domain/user_detail.dart';
import 'user_detail_dto.dart';

class UserMapper {
  static UserDetail toUserDetail(UserDetailDto userDetailDto) => UserDetail(
        pk: userDetailDto.pk,
        username: userDetailDto.username,
        email: userDetailDto.email,
      );
  static UserDetailDto toUserDetailDto(UserDetail userDetail) => UserDetailDto(
        pk: userDetail.pk,
        username: userDetail.username,
        email: userDetail.email,
      );
}
