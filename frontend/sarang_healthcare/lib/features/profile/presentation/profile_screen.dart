import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_button.dart';
import 'package:sarang_healthcare/features/doc_appointment/application/cubit/doc_appointment_cubit.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/widgets/connection_lost.dart';
import '../../../core/shared/api_constants.dart';
import '../../login/application/cubit/login_cubit.dart';
import '../application/cubit/profile_cubit.dart';
import 'widgets/profile_view.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            SarangAppbar(
              title: 'Profile',
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.canvas,
                ),
                onPressed: () {
                  HapticFeedback.mediumImpact();
                  context.pop();
                },
              ),
            ),
            BlocBuilder<ProfileCubit, ProfileState>(
              builder: (context, state) {
                return state.maybeWhen(
                  loadedCache: (userDetail) => userDetail.isDoctor == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: CircularProfileAvatar(
                            "${ApiConstants.baseUrl}/media/${userDetail.image}",
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            placeHolder: (context, url) => const SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(),
                            ),
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            cacheImage: true,
                            showInitialTextAbovePicture: false,
                          ),
                        )
                      : const SizedBox(),
                  loadedNetwork: (userDetail) => userDetail.isDoctor == true
                      ? Padding(
                          padding: const EdgeInsets.symmetric(vertical: 30),
                          child: CircularProfileAvatar(
                            "${ApiConstants.baseUrl}/media/${userDetail.image}",
                            errorWidget: (context, url, error) =>
                                const Icon(Icons.error),
                            placeHolder: (context, url) => const SizedBox(
                              width: 80,
                              height: 80,
                              child: CircularProgressIndicator(),
                            ),
                            radius: 60,
                            backgroundColor: Colors.transparent,
                            cacheImage: true,
                            showInitialTextAbovePicture: false,
                          ),
                        )
                      : const SizedBox(),
                  loading: () => CircularProgressIndicator(),
                  notLoaded: (message) {
                    return ConnectionLost(
                      onRetry: () {
                  HapticFeedback.mediumImpact();
                        context.read<ProfileCubit>().getUserDetails();
                      },
                    );
                  },
                  orElse: () => const SizedBox.shrink(),
                );
              },
            ),
            CanvasCard(
              child: Column(
                children: [
                  Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      BlocBuilder<ProfileCubit, ProfileState>(
                        builder: (context, state) {
                          return state.maybeWhen(
                            loadedCache: (userDetail) =>
                                ProfileView(userDetail: userDetail),
                            loadedNetwork: (userDetail) =>
                                ProfileView(userDetail: userDetail),
                            loading: () => CircularProgressIndicator(),
                            notLoaded: (message) {
                              return ConnectionLost(
                                onRetry: () {
                  HapticFeedback.mediumImpact();
                                  context.read<ProfileCubit>().getUserDetails();
                                },
                              );
                            },
                            orElse: () => const SizedBox.shrink(),
                          );
                        },
                      ),
                    ],
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.bottomCenter,
                      child: SarangButton(
                          onPressed: () {
                            HapticFeedback.mediumImpact();
                            context.read<LoginCubit>().logOut();
                            context.read<DocAppointmentCubit>().clearState();
                          },
                          isLoading: false,
                          label: 'Log Out'),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                ],
              ),
            )
            // Expanded(
            //   child: Container(
            //     width: double.infinity,
            //     decoration: const BoxDecoration(
            //       color: AppColor.canvas,
            //       borderRadius: BorderRadius.only(
            //         topLeft: Radius.circular(30),
            //         topRight: Radius.circular(30),
            //       ),
            //     ),
            //     padding:
            //         const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
            //     child:
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
