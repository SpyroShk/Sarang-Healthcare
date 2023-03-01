import 'dart:developer';

import 'package:hive_flutter/hive_flutter.dart';

import '../dtos/user_detail_dto.dart';

class UserDetailStorage {
  final boxName = "users";
  late Box _box;

  Future<Box> openBox() async {
    _box = await Hive.openBox<UserDetailDto>(boxName);
    return _box;
  }

  Future<UserDetailDto?> getUserDetails() async {
    await openBox();
    log("message");

    final boxValue = _box.values;
    if (boxValue.isEmpty) {
      return null;
    }
    return boxValue.toList()[0];
  }

  Future storeUserDetails(UserDetailDto userDetails) async {
    await openBox();
    await _box.clear();

    _box.put(userDetails.pk, userDetails);
  }

  void clear() async {
    await openBox();
    await _box.clear();
  }
}
