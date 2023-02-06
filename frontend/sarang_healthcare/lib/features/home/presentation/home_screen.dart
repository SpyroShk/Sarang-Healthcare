import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/features/home/presentation/widgets/widgets.dart';

import '../../../core/presentation/route/app_router.dart';
import '../../../core/presentation/theme/app_color.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
                            Text(
                              'Hello,',
                              style: TextStyle(
                                fontSize: Sizes.s16,
                                fontWeight: FontWeight.w500,
                              ),
                            ),
                            Text(
                              'Patients Name,',
                              style: TextStyle(
                                  fontSize: Sizes.s20,
                                  fontWeight: FontWeight.w900),
                            ),
                          ],
                        ),
                        IconButton(
                            onPressed: () {}, icon: Icon(Icons.notifications))
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
                            onPressed: () {},
                            icon: Icons.medical_information_outlined,
                          ),
                          CardButton(
                            title: 'Contact',
                            onPressed: () {},
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
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20,
                      vertical: 30,
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
                          height: 50,
                        ),
                        QuickButton(
                          title: 'Create new Appointment',
                          onPressed: () {},
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        QuickButton(
                          title: 'Book for lab testing',
                          onPressed: () {},
                        ),
                      ],
                    ),
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
