import '../../domain/lab_testing_detail.dart';
import 'lab_testing_detail_dto.dart';

class LabTestingMapper {
  static LabTestingDetailDto toDto(
          LabTestingDetail labTestingDetail) =>
      LabTestingDetailDto(
        userId: labTestingDetail.userId,
        username: labTestingDetail.username,
        testList: labTestingDetail.testList,
        collectionDate: labTestingDetail.collectionDate,
        collectionTime: labTestingDetail.collectionTime,
        contact: labTestingDetail.contact,
        patientName: labTestingDetail.patientName,
        age: labTestingDetail.age,
        gender: labTestingDetail.gender,
        userPatientRelation: labTestingDetail.userPatientRelation,
        service: labTestingDetail.service,
        city: labTestingDetail.city,
        address: labTestingDetail.address,
        landmark: labTestingDetail.landmark,
      );
}
