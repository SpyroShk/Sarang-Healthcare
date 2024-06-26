import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/lab_tests/application/cubit/lab_tests_cubit.dart';

import '../../../core/presentation/route/app_router.dart';
import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/theme/sizes.dart';
import '../../../core/presentation/widgets/widgets.dart';
import '../../lab_tests/domain/lab_tests_model.dart';
import '../../lab_tests/presentation/widgets/component/lab_tests_title.dart';

class OnSite extends StatefulWidget {
  final List<LabTestsModel>? selectedLabTests;
  final String tabName;
  const OnSite({
    super.key,
    required this.selectedLabTests,
    required this.tabName,
  });

  @override
  State<OnSite> createState() => _OnSiteState();
}

class _OnSiteState extends State<OnSite> {
  final formKey = GlobalKey<FormState>();

  late DateTime collectionDateTime;
  final contactController = TextEditingController();
  final patientNameController = TextEditingController();
  final ageController = TextEditingController();
  final testNameController = TextEditingController();
  final cityController = TextEditingController();
  final addressController = TextEditingController();
  final landmarkController = TextEditingController();

  String selectedGenderValue = 'Male';
  String selectedRelationValue = 'Self';

  final gender = [
    'Male',
    'Female',
    'Others',
  ];

  final relation = [
    'Self',
    'Mother',
    'Father',
    'Sister',
    'Brother',
    'Husband',
    'Wife',
    'Son',
    'Daughter',
    'In-Laws',
  ];

  @override
  void initState() {
    super.initState();
    final now = DateTime.now();
    collectionDateTime = DateTime(now.year, now.month, now.day, 07, 00);
    testNameController.text = 'No Tests selected yet.';
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            const SizedBox(
              height: 30,
            ),
            OutlinedButton(
              style: ElevatedButton.styleFrom(
                side: const BorderSide(color: AppColor.grey),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12.0),
                ),
              ),
              onPressed: () {
                HapticFeedback.mediumImpact();
                widget.selectedLabTests == null
                    ? context.push(AppRoutes.labtests)
                    : context.pop();
              },
              child: SizedBox(
                height: 58,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: const [
                    Text(
                      'Select Tests First',
                      style:
                          TextStyle(fontSize: Sizes.s16, color: AppColor.grey),
                    ),
                    Icon(
                      Icons.science_outlined,
                      size: 22,
                      color: AppColor.grey,
                    )
                  ],
                ),
              ),
            ),
            widget.selectedLabTests != null
                ? widget.selectedLabTests!.isNotEmpty
                    ? ListView.separated(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                padding: const EdgeInsets.all(30),
                                height: 140,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: AppColor.primary.withOpacity(0.1),
                                ),
                                child: Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    LabTestsTitle(
                                      labTests: widget.selectedLabTests![index],
                                      controller: testNameController,
                                      validator: (value) {
                                        if (value == 'Tests') {
                                          return 'Select your tests.';
                                        }
                                        return null;
                                      },
                                    ),
                                    GestureDetector(
                                      onTap: () {
                                        HapticFeedback.mediumImpact();
                                        setState(() {
                                          widget.selectedLabTests!
                                              .removeAt(index);
                                        });
                                      },
                                      child: Icon(
                                        Icons.remove_circle,
                                        color: AppColor.error.withOpacity(0.5),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          );
                        },
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 18,
                          );
                        },
                        itemCount: widget.selectedLabTests!.length,
                      )
                    : Column(
                        children: [
                          const SizedBox(
                            height: 24,
                          ),
                          TextFormField(
                            textAlign: TextAlign.center,
                            showCursor: false,
                            readOnly: true,
                            focusNode: AlwaysDisabledFocusNode(),
                            controller: testNameController,
                            decoration: const InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.zero,
                              border: InputBorder.none,
                            ),
                            style: const TextStyle(
                              fontSize: Sizes.s20,
                              fontWeight: FontWeight.bold,
                            ),
                            validator: (value) {
                              if (value == 'No Tests selected yet.') {
                                return 'Select your tests.';
                              }
                              return null;
                            },
                          ),
                          // Text('No Tests selected yet.'),
                        ],
                      )
                : Column(
                    children: [
                      const SizedBox(
                        height: 24,
                      ),
                      TextFormField(
                        textAlign: TextAlign.center,
                        showCursor: false,
                        readOnly: true,
                        focusNode: AlwaysDisabledFocusNode(),
                        controller: testNameController,
                        decoration: const InputDecoration(
                          isDense: true,
                          contentPadding: EdgeInsets.zero,
                          border: InputBorder.none,
                        ),
                        style: const TextStyle(
                          fontSize: Sizes.s20,
                          fontWeight: FontWeight.bold,
                        ),
                        validator: (value) {
                          if (value == 'No Tests selected yet.') {
                            return 'Select your tests.';
                          }
                          return null;
                        },
                      ),
                      // Text('No Tests selected yet.'),
                    ],
                  ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: DataTimeSelector(
                    text: Utils.toDate(collectionDateTime),
                    icon: Icons.calendar_month_outlined,
                    onPressed: () => pickCollectionDateTime(pickDate: true),
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: DataTimeSelector(
                    text: Utils.toTime(collectionDateTime),
                    icon: Icons.access_time_outlined,
                    onPressed: () => pickCollectionDateTime(pickDate: false),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Textfield(
              labelText: 'Contact',
              keyboardType: TextInputType.number,
              disableSuffixIcon: false,
              suffixIcon: Icons.phone_outlined,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Contacts can\'t be empty.';
                } else if (!RegExp(r'^(\+977)?9\d{9}$').hasMatch(value)) {
                  return 'Please enter a valid Contact Number.';
                }

                return null;
              },
              textcontroller: contactController,
            ),
            const SizedBox(
              height: 24,
            ),
            Textfield(
              labelText: "Patient's Full Name",
              disableSuffixIcon: false,
              suffixIcon: Icons.person_outline,
              validator: (value) {
                if (value!.isEmpty) {
                  return 'Patient Name can\'t be empty.';
                } else if (!RegExp(
                        r"^\s*([A-Za-z]{1,}([\.,] |[-']| ))+[A-Za-z]+\.?\s*$")
                    .hasMatch(value)) {
                  return 'Please enter a valid Patient Name.';
                }

                return null;
              },
              textcontroller: patientNameController,
            ),
            const SizedBox(
              height: 24,
            ),
            Row(
              children: [
                Expanded(
                  child: Textfield(
                    keyboardType: TextInputType.number,
                    labelText: 'Age',
                    disableSuffixIcon: false,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Age can\'t be empty.';
                      } else if (!RegExp(
                              r'^[1-9][0-9]{0,1}$|^1[0-2][0-9]$|^130$')
                          .hasMatch(value)) {
                        return 'Invalid Age.';
                      }
                      return null;
                    },
                    textcontroller: ageController,
                  ),
                ),
                const SizedBox(
                  width: 24,
                ),
                Expanded(
                  child: Container(
                    height: 58,
                    padding: const EdgeInsets.only(right: 5),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        color: AppColor.grey,
                      ),
                    ),
                    child: DropdownButtonHideUnderline(
                      child: ButtonTheme(
                        alignedDropdown: true,
                        padding: EdgeInsets.zero,
                        child: DropdownButton(
                          borderRadius: BorderRadius.circular(12),
                          alignment: Alignment.bottomCenter,
                          icon: const Icon(Icons.keyboard_arrow_down),
                          style: Theme.of(context).textTheme.titleLarge,
                          items: gender.map((option) {
                            return DropdownMenuItem(
                              value: option,
                              alignment: Alignment.centerLeft,
                              child: Padding(
                                padding: const EdgeInsets.only(right: 3),
                                child: Text(
                                  option,
                                  style: const TextStyle(
                                      fontSize: Sizes.s16,
                                      color: AppColor.grey),
                                ),
                              ),
                            );
                          }).toList(),
                          onChanged: (String? newValue) {
                            setState(() {
                              selectedGenderValue = newValue!;
                            });
                          },
                          value: selectedGenderValue,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              height: 58,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.only(right: 5),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(
                  color: AppColor.grey,
                ),
              ),
              child: DropdownButtonHideUnderline(
                child: ButtonTheme(
                  alignedDropdown: true,
                  padding: EdgeInsets.zero,
                  child: DropdownButton(
                    borderRadius: BorderRadius.circular(12),
                    alignment: Alignment.bottomCenter,
                    icon: const Icon(Icons.keyboard_arrow_down),
                    style: Theme.of(context).textTheme.titleLarge,
                    items: relation.map((option) {
                      return DropdownMenuItem(
                        value: option,
                        alignment: Alignment.centerLeft,
                        child: Padding(
                          padding: const EdgeInsets.only(right: 3),
                          child: Text(
                            option,
                            style: const TextStyle(
                                fontSize: Sizes.s16, color: AppColor.grey),
                          ),
                        ),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        selectedRelationValue = newValue!;
                      });
                    },
                    value: selectedRelationValue,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 10),
              decoration: BoxDecoration(
                color: AppColor.secondary.withOpacity(0.3),
                borderRadius: const BorderRadius.all(
                  Radius.circular(12),
                ),
              ),
              child: Row(
                children: const [
                  Icon(
                    Icons.error,
                    size: 18,
                    color: AppColor.secondary,
                  ),
                  SizedBox(
                    width: 6,
                  ),
                  Expanded(
                    child: Text(
                      'Complete necessary data before continuing.\nNote: The lab will remain open from 7am to 6pm.',
                      style: TextStyle(
                        fontSize: Sizes.s12,
                        color: AppColor.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 24,
            ),
            BlocBuilder<LabTestsCubit, LabTestsState>(
              builder: (context, state) {
                return SarangButton(
                  onPressed: continueHandler,
                  isLoading: state.maybeWhen(
                    orElse: () => false,
                    loading: () => true,
                  ),
                  label: 'Continue',
                );
              },
            ),
            const SizedBox(
              height: 30,
            ),
          ],
        ),
      ),
    );
  }

  void continueHandler() {
    HapticFeedback.mediumImpact();
    if (formKey.currentState!.validate()) {
      final contact = contactController.text.trim();
      final patientName = patientNameController.text.trim();
      final age = ageController.text.trim();
      testNameController;
      final city = cityController.text.trim() == ''
          ? 'No city'
          : cityController.text.trim();
      final address = addressController.text.trim() == ''
          ? 'No address'
          : addressController.text.trim();
      final landmark = landmarkController.text.trim() == ''
          ? 'No landmark'
          : landmarkController.text.trim();
      double total = widget.selectedLabTests!.fold(
          0,
          (previousValue, element) =>
              previousValue + double.parse(element.price));
      log(total.toString());
      // final appointmentsListWithoutId = context
      //     .read<AppointmentListCubit>()
      //     .getAppointmentsListWithoutIdDetail();

      // bool hasConflict = false;
      // for (final appointment in appointmentsListWithoutId) {
      //   String timeString = appointment.appointmentTime;
      //   DateTime time = DateFormat('H:mm:ss').parse(timeString);
      //   String formattedTime = DateFormat('H:mm').format(time);

      //   String dateString = appointment.appointmentDate;
      //   DateTime date = DateTime.parse(dateString);
      //   String formattedDate = DateFormat('yyyy-M-d').format(date);

      //   if (formattedDate == Utils.toDate(appointmentDateTime) &&
      //       formattedTime == Utils.toTime(appointmentDateTime) &&
      //       appointment.doctorId == widget.preferredDoctor.id) {
      //     hasConflict = true;
      //     break;
      //   }
      // }

      // if (hasConflict) {
      //   context.showCustomSnackBar(
      //       message:
      //           'The Date and Time you picked is already picked by someone else, please pick a new time',
      //       result: false);
      // } else {
      context.push(AppRoutes.payment, extra: {
        'appointmentDate': Utils.toDate(collectionDateTime),
        'appointmentTime': Utils.toTime(collectionDateTime),
        'contact': int.parse(contact),
        'patientName': patientName,
        'age': int.parse(age),
        'testName': widget.selectedLabTests.toString(),
        'gender': selectedGenderValue,
        'userPatientRelation': selectedRelationValue,
        'city': city,
        'address': address,
        'landmark': landmark,
        'service': widget.tabName,
        'boolValue': true,
        'total': total.toString(),
      });
      //   }
    }
  }

  Future pickCollectionDateTime({required bool pickDate}) async {
    final date = await pickDateTime(collectionDateTime,
        pickDate: pickDate, firstDate: DateTime.now());
    if (date == null) return;
    // if (date.isAfter(to)) {
    //   to = DateTime(date.year, date.month, date.day, to.hour);
    // }
    setState(() {
      collectionDateTime = date;
    });
  }

  Future<DateTime?> pickDateTime(
    DateTime initialDate, {
    required bool pickDate,
    DateTime? firstDate,
  }) async {
    if (pickDate) {
      final date = await showDatePicker(
        context: context,
        initialDate: initialDate,
        firstDate: firstDate ?? DateTime(2013, 1),
        lastDate: DateTime(2101),
      );
      if (date == null) return null;
      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );
      return date.add(time);
    } else {
      final now = DateTime.now();
      DateTime forInitial = initialDate;
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(forInitial),
      );
      if (timeOfDay == null) return null;
      final dateTime = DateTime(
          now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);

      int hrFrom = 07;
      int minFrom = 00;
      int hrTo = 18;
      int minTo = 00;
      if (dateTime.hour > hrTo ||
          dateTime.hour < hrFrom ||
          (dateTime.hour == hrFrom && dateTime.minute < minFrom) ||
          (dateTime.hour == hrTo && dateTime.minute > minTo)) {
        // ignore: use_build_context_synchronously
        context.showCustomSnackBar(
            message: 'Sorry Lab closed in selected Time.', result: false);
        return null;
      }
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }
}
