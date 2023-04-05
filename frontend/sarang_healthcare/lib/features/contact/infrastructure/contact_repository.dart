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
    String url = "${ApiConstants.baseUrl}/contact/1/";

    try {
      final response = await _dio.get(url);
      final respData = Map<String, dynamic>.from(response.data);

      final dto = ContactModelDto.fromJson(respData);
      final detail = ContactMapper.toContactModel(dto);
      storeContactModels(detail);

      return Right(
        ContactSuccess.network(
          apiData: detail,
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

  Future<void> storeContactModels(ContactModel contactModel) async {
    final contactModelDto = ContactMapper.toContactModelDto(contactModel);
    await _contactModelStorage.storeContactModels(contactModelDto);
  }

  Future<ContactModel?> getCachedDetails() async {
    final contactModelDto = await _contactModelStorage.getContactModels();
    if (contactModelDto == null) {
      return null;
    }
    final contactModels = ContactMapper.toContactModel(contactModelDto);
    return contactModels;
    // if (contactModelDto == null) {
    //   return null;
    // }
    // final contactModel = ContactMapper.toContactModel(contactModelDto);
    // return contactModel;
  }
}
