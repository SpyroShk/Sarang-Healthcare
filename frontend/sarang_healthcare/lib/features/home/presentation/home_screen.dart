import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/features/appointment_list/presentation/widgets/appointment_list_item.dart';
import 'package:sarang_healthcare/features/home/presentation/widgets/widgets.dart';
import 'package:shimmer/shimmer.dart';

import '../../../core/presentation/route/app_router.dart';
import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/widgets/skeleton.dart';
import '../../appointment_list/application/cubit/appointment_list_cubit.dart';
import '../../profile/application/cubit/profile_cubit.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<AppointmentListCubit>().getAppointmentListDetail();
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
                                String? username = state.maybeWhen(
                                    loadedCache: (userDetail) =>
                                        userDetail.username,
                                    loadedNetwork: (userDetail) =>
                                        userDetail.username,
                                    orElse: () => null);
                                return Text(
                                  username.toString(),
                                  style: const TextStyle(
                                    fontSize: Sizes.s22,
                                    fontWeight: FontWeight.bold,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        IconButton(
                          onPressed: () {
                            context
                                .read<AppointmentListCubit>()
                                .getAppointmentListDetail();
                          },
                          icon: const Icon(Icons.refresh),
                        ),
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
                            title: 'Doctors',
                            onPressed: () {
                              HapticFeedback.mediumImpact();
                              context.push(AppRoutes.preferreddoc);
                            },
                            icon: Icons.medical_services_outlined,
                          ),
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
              BlocBuilder<AppointmentListCubit, AppointmentListState>(
                builder: (context, state) {
                  return state.maybeWhen(
                    loadedNetwork: (appointmentListGroup) {
                      final appointmentfilter = DateTime.parse(
                              '${appointmentListGroup.last.appointmentDate} ${appointmentListGroup.last.appointmentTime}')
                          .isBefore(DateTime.now());
                      if (appointmentListGroup.isEmpty || appointmentfilter) {
                        return const Text(
                          'No New Appointments Yet!',
                          style: TextStyle(
                            fontSize: Sizes.s20,
                            fontWeight: FontWeight.w600,
                          ),
                        );
                      }
                      return SizedBox(
                        height: 180,
                        child: ListView.builder(
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: 1,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 20, vertical: 0),
                          itemBuilder: (context, index) {
                            return AppointmentListItem(
                              appointmentList: appointmentListGroup.last,
                            );
                          },
                        ),
                      );
                    },
                    loading: () => Shimmer.fromColors(
                      baseColor: AppColor.shimmerBase,
                      highlightColor: AppColor.shimmerHighlight,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: const Skeleton(
                          width: double.infinity,
                          height: 180,
                        ),
                      ),
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
              const SizedBox(
                height: 25,
              ),
              Expanded(
                child: Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20,
                    vertical: 25,
                  ),
                  decoration: const BoxDecoration(
                    color: AppColor.canvas,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Quick Actions',
                        style: GoogleFonts.inter(
                          fontWeight: FontWeight.w700,
                          fontSize: Sizes.s32,
                        ),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      QuickButton(
                        title: 'Create new Appointment',
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          context.push(AppRoutes.docappointment);
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      QuickButton(
                        title: 'Book for lab testing',
                        onPressed: () {
                          HapticFeedback.mediumImpact();
                          context.push(AppRoutes.labtesting);
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
