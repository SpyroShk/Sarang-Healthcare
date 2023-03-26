import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:intl/intl.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';

import '../../../core/presentation/route/app_router.dart';
import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/theme/sizes.dart';
import '../../../core/presentation/widgets/widgets.dart';
import '../../appointment_list/application/cubit/appointment_list_cubit.dart';
import '../../preferred_doctor/domain/preferred_doctor_model.dart';
import 'widgets/widgets.dart';

class DocAppointment extends StatefulWidget {
  const DocAppointment({super.key, required this.preferredDoctor});
  final PreferredDoctorModel preferredDoctor;

  @override
  State<DocAppointment> createState() => _DocAppointmentState();
}

class _DocAppointmentState extends State<DocAppointment> {
  late DateTime appointmentDateTime;
  final formKey = GlobalKey<FormState>();

  final contactController = TextEditingController();
  final patientNameController = TextEditingController();
  final ageController = TextEditingController();
  final doctorNameController = TextEditingController();
  final patientDescriptionController = TextEditingController();

  String selectedGenderValue = 'Male';
  String selectedRelationValue = 'Self';

  // List of items in our dropdown menu
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
    var now = DateTime.now();
    if (now.weekday == DateTime.saturday) {
      now = now.add(const Duration(days: 1));
    }
    appointmentDateTime = DateTime(now.year, now.month, now.day, 12, 00);
    doctorNameController.text = 'No Doctor selected yet.';
    context.read<AppointmentListCubit>().getAppointmentListWithoutIdDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            SarangAppbar(
              title: 'Create new appointment',
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.canvas,
                ),
                onPressed: () => context.pop(),
              ),
            ),
            CanvasCard(
              child: SingleChildScrollView(
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
                        onPressed: () =>
                            context.pushReplacement(AppRoutes.preferreddoc),
                        child: SizedBox(
                          height: 58,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: const [
                              Text(
                                'Select Your Preferred Doctor First',
                                style: TextStyle(
                                    fontSize: Sizes.s16, color: AppColor.grey),
                              ),
                              Icon(
                                Icons.local_hospital_outlined,
                                size: 22,
                                color: AppColor.grey,
                              )
                            ],
                          ),
                        ),
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      widget.preferredDoctor != null
                          ? PreferredDoctorCard(
                              preferredDoctor: widget.preferredDoctor,
                            )
                          : Column(
                              children: [
                                TextFormField(
                                  textAlign: TextAlign.center,
                                  showCursor: false,
                                  readOnly: true,
                                  focusNode: AlwaysDisabledFocusNode(),
                                  controller: doctorNameController,
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
                                    if (value == 'No Doctor selected yet.') {
                                      return 'Select your Doctor.';
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
                          DataTimeSelector(
                            text: Utils.toDate(appointmentDateTime),
                            icon: Icons.calendar_month_outlined,
                            width: MediaQuery.of(context).size.width / 1.90,
                            onPressed: () =>
                                pickAppointmentDateTime(pickDate: true),
                          ),
                          const SizedBox(
                            width: 24,
                          ),
                          Expanded(
                            child: DataTimeSelector(
                              text: Utils.toTime(appointmentDateTime),
                              icon: Icons.access_time_outlined,
                              onPressed: () {
                                if (widget.preferredDoctor != null) {
                                  pickAppointmentDateTime(pickDate: false);
                                } else {
                                  return context.showCustomSnackBar(
                                      message: 'Please select Doctor first.',
                                      result: false);
                                }
                              },
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
                          } else if (!RegExp(r'^(\+977)?9\d{9}$')
                              .hasMatch(value)) {
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
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    items: gender.map((option) {
                                      return DropdownMenuItem(
                                        value: option,
                                        alignment: Alignment.centerLeft,
                                        child: Padding(
                                          padding:
                                              const EdgeInsets.only(right: 3),
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
                              style: Theme.of(context).textTheme.headline6,
                              items: relation.map((option) {
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
                      Textfield(
                        hintText:
                            'Any past medical history and previous doctors can be mentioned here.',
                        maxLines: 8,
                        labelText: "Patient's Description (Optional)",
                        disableSuffixIcon: false,
                        textcontroller: patientDescriptionController,
                      ),
                      const SizedBox(
                        height: 24,
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 16, vertical: 10),
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
                                'Complete necessary data before continuing.\nNote: The appointments will last max upto 15 minutes.',
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
                      BlocBuilder<AppointmentListCubit, AppointmentListState>(
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
              ),
            ),
          ],
        ),
      ),
    );
  }

  void continueHandler() {
    if (formKey.currentState!.validate()) {
      final contact = contactController.text.trim();
      final patientName = patientNameController.text.trim();
      final age = ageController.text.trim();
      doctorNameController;
      final patientDescription = patientDescriptionController.text.trim() == ''
          ? 'No description.'
          : patientDescriptionController.text.trim();
      String total = "800.00";
      final appointmentsListWithoutId = context
          .read<AppointmentListCubit>()
          .getAppointmentsListWithoutIdDetail();

      bool hasConflict = false;
      for (final appointment in appointmentsListWithoutId) {
        String timeString = appointment.appointmentTime;
        String dateString = appointment.appointmentDate;

        DateTime initialStartTime = DateTime.parse("$dateString $timeString");
        DateTime startTime =
            initialStartTime.subtract(const Duration(minutes: 1));
        DateTime endTime = startTime.add(const Duration(minutes: 16));

        DateTime date = DateTime.parse(dateString);
        String formattedDate = DateFormat('yyyy-M-d').format(date);

        log("user: ${appointmentDateTime.toString()}");
        log("start: ${startTime.toString()}");
        log("end: ${endTime.toString()}");

        if (formattedDate == Utils.toDate(appointmentDateTime) &&
            appointment.doctorId == widget.preferredDoctor.id &&
            (appointmentDateTime.isAfter(startTime) &&
                appointmentDateTime.isBefore(endTime))) {
          hasConflict = true;
          break;
        }
      }

      if (hasConflict) {
        context.showCustomSnackBar(
            message:
                'The Date and Time you picked is already picked by someone else, please pick a new time.',
            result: false);
      } else {
        context.push(AppRoutes.payment, extra: {
          'doctorId': widget.preferredDoctor.id,
          'doctorCategory': widget.preferredDoctor.category,
          'doctorImage': widget.preferredDoctor.image,
          'appointmentDate': Utils.toDate(appointmentDateTime),
          'appointmentTime': Utils.toTime(appointmentDateTime),
          'contact': int.parse(contact),
          'patientName': patientName,
          'age': int.parse(age),
          'doctorName': widget.preferredDoctor.name,
          'gender': selectedGenderValue,
          'userPatientRelation': selectedRelationValue,
          'patientDescription': patientDescription,
          'boolValue': false,
          'total': total,
        });
      }
    }
  }

  Future pickAppointmentDateTime({required bool pickDate}) async {
    final date = await pickDateTime(appointmentDateTime,
        pickDate: pickDate, firstDate: DateTime.now());
    if (date == null) return;
    // if (date.isAfter(to)) {
    //   to = DateTime(date.year, date.month, date.day, to.hour);
    // }
    setState(() {
      appointmentDateTime = date;
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
        selectableDayPredicate: (DateTime val) {
          // Disabling Saturdays
          return val.weekday != DateTime.saturday;
        },
      );
      if (date == null) return null;
      final time = Duration(
        hours: initialDate.hour,
        minutes: initialDate.minute,
      );
      return date.add(time);
    } else {
      final now = DateTime.now();
      DateTime forInitial =
          DateTime.parse("2023-03-05 ${widget.preferredDoctor.availableTo}");
      final timeOfDay = await showTimePicker(
        context: context,
        initialTime: TimeOfDay.fromDateTime(forInitial),
        builder: (BuildContext context, Widget? child) {
          return MediaQuery(
            data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
            child: child!,
          );
        },
      );
      if (timeOfDay == null) return null;
      final dateTime = DateTime(
          now.year, now.month, now.day, timeOfDay.hour, timeOfDay.minute);
// Disabling times
      DateTime to =
          DateTime.parse("2023-03-05 ${widget.preferredDoctor.availableTo}");
      int formattedToHr = int.parse(DateFormat('HH').format(to));
      int formattedToMin = int.parse(DateFormat('mm').format(to));
      DateTime from =
          DateTime.parse("2023-03-05 ${widget.preferredDoctor.availableFrom}");
      int formattedFromHr = int.parse(DateFormat('HH').format(from));
      int formattedFromMin = int.parse(DateFormat('mm').format(from));

      if (dateTime.hour > formattedToHr ||
          dateTime.hour < formattedFromHr ||
          (dateTime.hour == formattedFromHr &&
              dateTime.minute < formattedFromMin) ||
          (dateTime.hour == formattedToHr &&
              dateTime.minute > formattedToMin)) {
        context.showCustomSnackBar(
            message: 'Doctor not available in selected Time.', result: false);
        return null;
      }
      final date =
          DateTime(initialDate.year, initialDate.month, initialDate.day);
      final time = Duration(hours: timeOfDay.hour, minutes: timeOfDay.minute);
      return date.add(time);
    }
  }
}
