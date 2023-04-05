import 'package:hive_flutter/hive_flutter.dart';

import '../dtos/contact_model_dto.dart';

class ContactModelStorage {
  final boxName = "contacts";
  late Box _box;

  Future<Box> openBox() async {
    _box = await Hive.openBox<ContactModelDto>(boxName);
    return _box;
  }

  Future<ContactModelDto?> getContactModels() async {
    await openBox();


    final boxValue = _box.values;
    if (boxValue.isEmpty) {
      return null;
    }
    return boxValue.toList()[0];
  }

  Future storeContactModels(ContactModelDto contactModels) async {
    await openBox();
    await _box.clear();

      _box.put(contactModels.id, contactModels);
  }

  void clear() async {
    await openBox();
    await _box.clear();
  }
}
