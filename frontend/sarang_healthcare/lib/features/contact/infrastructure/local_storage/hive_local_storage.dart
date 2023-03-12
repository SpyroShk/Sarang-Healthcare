import 'package:hive_flutter/hive_flutter.dart';

import '../dtos/contact_model_dto.dart';

abstract class HiveLocalStorage {
  Future<Box> openBox();
  Future<ContactModelDto> getContactModels();
  Future<void> storeContactModels(ContactModelDto contactModels);
  void clear();
}
