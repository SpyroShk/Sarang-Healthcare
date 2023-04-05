import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/features/appointment_list/presentation/widgets/widgets.dart';

import '../../../core/presentation/route/app_router.dart';
import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/theme/gradient_bg.dart';
import '../../../core/presentation/theme/sizes.dart';
import '../../appointment_list/application/cubit/appointment_list_cubit.dart';
import '../../home/presentation/widgets/card_button.dart';
import '../../profile/application/cubit/profile_cubit.dart';

class DocHomeScreen extends StatefulWidget {
  const DocHomeScreen({super.key});

  @override
  State<DocHomeScreen> createState() => _DocHomeScreenState();
}

class _DocHomeScreenState extends State<DocHomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppointmentListCubit>().getAppointmentListDetailForDoc();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Padding(
          padding: const EdgeInsets.only(top: 50),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: Sizes.s18,
                                fontWeight: FontWeight.w500,
                                color: AppColor.canvas,
                              ),
                            ),
                            BlocBuilder<ProfileCubit, ProfileState>(
                              builder: (context, state) {
                                String? name = state.maybeWhen(
                                    loadedCache: (userDetail) =>
                                        "${userDetail.firstName} ${userDetail.lastName}",
                                    loadedNetwork: (userDetail) =>
                                        "${userDetail.firstName} ${userDetail.lastName}",
                                    orElse: () => null);
                                return SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.75,
                                  child: Text(
                                    "Dr. ${name.toString()}",
                                    maxLines: 2,
                                    style: const TextStyle(
                                      fontSize: Sizes.s22,
                                      fontWeight: FontWeight.bold,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {},
                            icon: const Icon(Icons.notifications))
                      ],
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    Container(
                      height: 120,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: AppColor.canvas,
                        boxShadow: const [
                          BoxShadow(
                            color: Color.fromRGBO(0, 0, 0, 0.1),
                            spreadRadius: 4,
                            blurRadius: 10,
                          ),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          CardButton(
                            title: 'Contact',
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              context.push(AppRoutes.contact);
                            },
                            icon: Icons.phone_android_outlined,
                          ),
                          CardButton(
                            title: 'Profile',
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              context.push(AppRoutes.profile);
                            },
                            icon: Icons.person_outline,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                  ],
                ),
              ),
              Expanded(
                child: BlocBuilder<AppointmentListCubit, AppointmentListState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loadedNetwork: (appointmentListGroup) {
                        if (appointmentListGroup.isEmpty) {
                          return const Text(
                            'No Appointments',
                            style: TextStyle(
                              fontSize: Sizes.s16,
                              fontWeight: FontWeight.w600,
                            ),
                          );
                        }
                        return ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.zero,
                          itemCount: 1,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Container(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20),
                                  child: AppointmentListItemDoc(
                                    appointmentList: appointmentListGroup.last,
                                  ),
                                ),
                                const SizedBox(
                                  height: 25,
                                ),
                                Container(
                                  width: double.infinity,
                                  height: MediaQuery.of(context).size.height,
                                  decoration: const BoxDecoration(
                                    color: AppColor.canvas,
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(30),
                                      topRight: Radius.circular(30),
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 25),
                                ),
                                // CanvasCard(
                                //   child: Text(appointmentListGroup
                                //       .last.patientDescription),
                                // )
                              ],
                            );
                          },
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loadFailure: (message) {
                        return const Text(
                          'Connection Lost!',
                          style: TextStyle(
                            fontSize: Sizes.s16,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
