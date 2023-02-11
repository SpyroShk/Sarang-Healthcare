import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';

import '../../../core/presentation/route/app_router.dart';
import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/theme/sizes.dart';
import '../../../core/presentation/widgets/sarang_appbar.dart';
import '../../../core/presentation/widgets/widgets.dart';
import 'widgets/widgets.dart';

class DocAppointment extends StatefulWidget {
  const DocAppointment({super.key});

  @override
  State<DocAppointment> createState() => _DocAppointmentState();
}

class _DocAppointmentState extends State<DocAppointment> {
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
    'In-Laws',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Create new appointment'),
            CanvasCard(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const SizedBox(
                      height: 50,
                    ),
                    OutlinedButton(
                      style: ElevatedButton.styleFrom(
                        side: const BorderSide(color: AppColor.grey),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                      ),
                      onPressed: () => context.push(AppRoutes.preferreddoc),
                      child: SizedBox(
                        height: 58,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: const [
                            Text(
                              'Select Your Preferred Doctor',
                              style: TextStyle(
                                  fontSize: Sizes.s16, color: AppColor.grey),
                            ),
                            Icon(
                              Icons.local_hospital_rounded,
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
                    Row(
                      children: const [
                        Expanded(
                          child: Textfield(
                            labelText: 'Date',
                            enablePrefixIcon: true,
                            prefixIcon: Icons.calendar_month_outlined,
                          ),
                        ),
                        SizedBox(
                          width: 24,
                        ),
                        Expanded(
                          child: Textfield(
                            labelText: 'Time',
                            enablePrefixIcon: true,
                            prefixIcon: Icons.access_time_outlined,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Textfield(
                      labelText: 'Contact',
                      enablePrefixIcon: false,
                      suffixIcon: Icons.phone_outlined,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    const Textfield(
                      labelText: "Patient's Name",
                      enablePrefixIcon: false,
                      suffixIcon: Icons.person_outline,
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    Row(
                      children: [
                        const Expanded(
                          child: Textfield(
                            labelText: 'Age',
                            enablePrefixIcon: false,
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
                                  style: Theme.of(context).textTheme.headline6,
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
                      height: 50,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 10),
                      decoration: BoxDecoration(
                        color: AppColor.grey.withOpacity(0.15),
                        borderRadius: const BorderRadius.all(
                          Radius.circular(12),
                        ),
                      ),
                      child: Row(
                        children: [
                          const Icon(
                            Icons.error,
                            size: 18,
                            color: AppColor.grey,
                          ),
                          const SizedBox(
                            width: 6,
                          ),
                          const Expanded(
                            child: Text(
                              'Complete necessary data before continuing.',
                              style: TextStyle(
                                fontSize: Sizes.s12,
                                color: AppColor.grey,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 24,
                    ),
                    SarangButton(
                      onPressed: () {},
                      isLoading: false,
                      label: 'Continue',
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
