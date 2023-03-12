import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../core/shared/api_constants.dart';
import '../domain/contact_failure.dart';
import '../domain/contact_success.dart';
import '../domain/contact_model.dart';
import 'dtos/contact_model_dto.dart';
import 'dtos/contact_mapper.dart';
import 'local_storage/contact_model_storage.dart';

class ContactRepository {
  final Dio _dio;
  final ContactModelStorage _contactModelStorage;

  ContactRepository({
    required Dio dio,
    required ContactModelStorage contactModelStorage,
  })  : _dio = dio,
        _contactModelStorage = contactModelStorage;

  Future<Either<ContactFailure, ContactSuccess>> contactModel() async {
    String url = "${ApiConstants.baseUrl}/contact/contactlist";

    try {
      final response = await _dio.get(url);
      final respData = response.data;
      List<ContactModel> listOfContacts = [];
      for (final contact in respData) {
        final dto = ContactModelDto.fromJson(contact);
        final model = ContactMapper.toContactModel(dto);
        listOfContacts.add(model);
        storeContactModels(listOfContacts);
      }
      return Right(
        ContactSuccess.network(
          apiData: listOfContacts,
        ),
      );
    } on DioError catch (e) {
      final cached = await getCachedDetails();
      if (cached != null) {
        return Right(
          ContactSuccess.cache(apiData: cached),
        );
      }

      final statusCode = e.response?.statusCode ?? 0;

      if (statusCode == 401) {
        return const Left(
          ContactFailure.client(
            message: 'Error',
          ),
        );
      } else if (statusCode > 500) {
        return const Left(
          ContactFailure.server(),
        );
      }
      return const Left(
        ContactFailure.network(),
      );
    }
  }

  Future<void> storeContactModels(List<ContactModel> contactModel) async {
    List<ContactModelDto> storeContactModel = [];

    for (final contact in contactModel) {
      final contactModelDto = ContactMapper.toContactModelDto(contact);
      storeContactModel.add(contactModelDto);
    }
    await _contactModelStorage.storeContactModels(storeContactModel);
  }

  Future<List<ContactModel>> getCachedDetails() async {
    final contactModelDto = await _contactModelStorage.getContactModels();
    List<ContactModel> storeCachedList = [];

    for (final contact in contactModelDto) {
      final contactModels = ContactMapper.toContactModel(contact);
      storeCachedList.add(contactModels);
    }

    return storeCachedList;
    // if (contactModelDto == null) {
    //   return null;
    // }
    // final contactModel = ContactMapper.toContactModel(contactModelDto);
    // return contactModel;
  }
}
