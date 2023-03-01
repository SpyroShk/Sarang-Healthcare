import '../../domain/lab_tests_model.dart';
import 'lab_tests_dto.dart';

class LabTestsMapper {
  static LabTestsModel toLabTestsDetail(
      LabTestsDto labTestsDto) {
    return LabTestsModel(
      id: labTestsDto.id,
      testName: labTestsDto.testName,
      price: labTestsDto.price,
    );
  }

  static LabTestsDto toLabTestsDetailDto(
      LabTestsModel labTestsModel) {
    return LabTestsDto(
      id: labTestsModel.id,
      testName: labTestsModel.testName,
      price: labTestsModel.price,
    );
  }
}
