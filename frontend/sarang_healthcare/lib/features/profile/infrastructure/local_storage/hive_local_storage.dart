import 'package:hive_flutter/hive_flutter.dart';

import '../dtos/user_detail_dto.dart';

abstract class HiveLocalStorage {
  Future<Box> openBox();
  Future<UserDetailDto> getUserDetails();
  Future<void> storeUserDetails(UserDetailDto userDetails);
  void clear();
}
