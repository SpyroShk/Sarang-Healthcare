import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../core/presentation/route/app_router.dart';
import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/theme/gradient_bg.dart';
import '../../../core/presentation/theme/sizes.dart';
import '../../home/presentation/widgets/card_button.dart';
import '../../profile/application/cubit/profile_cubit.dart';

class DocHomeScreen extends StatelessWidget {
  const DocHomeScreen({super.key});

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
                                  "Dr. ${username.toString()}",
                                  style: const TextStyle(
                                    fontSize: Sizes.s22,
                                    fontWeight: FontWeight.bold,
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
                            onPressed: () => context.push(AppRoutes.contact),
                            icon: Icons.phone_android_outlined,
                          ),
                          CardButton(
                            title: 'Profile',
                            onPressed: () => context.push(AppRoutes.profile),
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
            ],
          ),
        ),
      ),
    );
  }
}
