import '../../domain/user_detail.dart';
import 'user_detail_dto.dart';

class UserMapper {
  static UserDetail toUserDetail(UserDetailDto userDetailDto) => UserDetail(
        pk: userDetailDto.pk,
        username: userDetailDto.username,
        email: userDetailDto.email,
        firstName: userDetailDto.firstName,
        lastName: userDetailDto.lastName,
        isDoctor: userDetailDto.isDoctor,
        qualifications: userDetailDto.qualifications,
        image: userDetailDto.image,
        availableFrom: userDetailDto.availableFrom,
        availableTo: userDetailDto.availableTo,
        category: userDetailDto.category,
      );
  static UserDetailDto toUserDetailDto(UserDetail userDetail) => UserDetailDto(
        pk: userDetail.pk,
        username: userDetail.username,
        email: userDetail.email,
        firstName: userDetail.firstName,
        lastName: userDetail.lastName,
        isDoctor: userDetail.isDoctor,
        qualifications: userDetail.qualifications,
        image: userDetail.image,
        availableFrom: userDetail.availableFrom,
        availableTo: userDetail.availableTo,
        category: userDetail.category,
      );
}
