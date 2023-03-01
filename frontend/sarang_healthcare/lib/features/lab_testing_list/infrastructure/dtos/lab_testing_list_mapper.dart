import '../../domain/lab_testing_list_model.dart';
import 'lab_testing_list_dto.dart';

class LabTestingListMapper {
  static LabTestingListModel toLabTestingListDetail(
      LabTestingListDto appointmentListDto) {
    return LabTestingListModel(
      id: appointmentListDto.id,
      userId: appointmentListDto.userId,
      username: appointmentListDto.username,
      testList: appointmentListDto.testList,
      collectionDate: appointmentListDto.collectionDate,
      collectionTime: appointmentListDto.collectionTime,
      contact: appointmentListDto.contact,
      patientName: appointmentListDto.patientName,
      age: appointmentListDto.age,
      gender: appointmentListDto.gender,
      userPatientRelation: appointmentListDto.userPatientRelation,
      service: appointmentListDto.service,
      city: appointmentListDto.city,
      address: appointmentListDto.address,
      landmark: appointmentListDto.landmark,
    );
  }

  static LabTestingListDto toLabTestingListDetailDto(
      LabTestingListModel appointmentListModel) {
    return LabTestingListDto(
      id: appointmentListModel.id,
      userId: appointmentListModel.userId,
      username: appointmentListModel.username,
      testList: appointmentListModel.testList,
      city: appointmentListModel.city,
      address: appointmentListModel.address,
      landmark: appointmentListModel.landmark,
      collectionDate: appointmentListModel.collectionDate,
      collectionTime: appointmentListModel.collectionTime,
      contact: appointmentListModel.contact,
      patientName: appointmentListModel.patientName,
      age: appointmentListModel.age,
      gender: appointmentListModel.gender,
      userPatientRelation: appointmentListModel.userPatientRelation,
      service: appointmentListModel.service,
    );
  }
}
