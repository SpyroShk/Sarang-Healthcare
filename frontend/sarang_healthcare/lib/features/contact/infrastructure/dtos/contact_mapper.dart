import '../../domain/contact_model.dart';
import 'contact_model_dto.dart';

class ContactMapper {
  static ContactModel toContactModel(ContactModelDto contactModelDto) =>
      ContactModel(
        id: contactModelDto.id,
        phone: contactModelDto.phone,
        mobile: contactModelDto.mobile,
        email: contactModelDto.email,
        location: contactModelDto.location,
        sm1: contactModelDto.sm1,
        sm2: contactModelDto.sm2,
        sm3: contactModelDto.sm3,
        sm4: contactModelDto.sm4,
      );
  static ContactModelDto toContactModelDto(ContactModel contactModel) =>
      ContactModelDto(
        id: contactModel.id,
        phone: contactModel.phone,
        mobile: contactModel.mobile,
        email: contactModel.email,
        location: contactModel.location,
        sm1: contactModel.sm1,
        sm2: contactModel.sm2,
        sm3: contactModel.sm3,
        sm4: contactModel.sm4,
      );
}
