import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_button.dart';

import '../../../core/presentation/theme/app_color.dart';
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
    return GradientBg(
      child: Scaffold(
        body: GradientBg(
          child: Column(
            children: [
              const SarangAppbar(title: 'Profile'),
              Expanded(
                child: Container(
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    color: AppColor.canvas,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(30),
                      topRight: Radius.circular(30),
                    ),
                  ),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 25, vertical: 50),
                  child: Column(
                    children: [
                      Column(
                        children: [
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              return state.maybeWhen(
                                loadedCache: (userDetail) {
                                  return ProfileView(userDetail: userDetail);
                                },
                                loadedNetwork: (userDetail) =>
                                    ProfileView(userDetail: userDetail),
                                loading: () => CircularProgressIndicator(),
                                notLoaded: (message) {
                                  return Text('fail');
                                  // ConnectionLost(
                                  //   onRetry: () {
                                  //     context.read<ProfileCubit>().getUserDetails();
                                  //   },
                                  // );
                                },
                                orElse: () => const SizedBox.shrink(),
                              );
                            },
                          ),
                          BlocBuilder<ProfileCubit, ProfileState>(
                            builder: (context, state) {
                              String? email = state.maybeWhen(
                                  loadedCache: (userDetail) => userDetail.email,
                                  loadedNetwork: (userDetail) =>
                                      userDetail.email,
                                  orElse: () => null);
                              return SizedBox(
                                height: 50,
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
                                context.read<LoginCubit>().logOut();
                              },
                              isLoading: false,
                              label: 'Log Out'),
                        ),
                      )
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
