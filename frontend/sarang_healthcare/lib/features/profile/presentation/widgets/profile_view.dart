import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/route/app_router.dart';
import 'package:sarang_healthcare/features/profile/presentation/widgets/profile_view_doc.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../domain/user_detail.dart';

class ProfileView extends StatelessWidget {
  final UserDetail userDetail;
  const ProfileView({super.key, required this.userDetail});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            border: Border.all(
              color: AppColor.grey,
              width: 0.5,
            ),
            color: AppColor.canvas,
            borderRadius: const BorderRadius.all(Radius.circular(18)),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              userDetail.isDoctor == true
                  ? Column(
                      children: [
                        ProfileViewDoc(
                          userDetail:
                              '${userDetail.firstName} ${userDetail.lastName}',
                          icon: Icons.medical_information_rounded,
                        ),
                        ProfileViewDoc(
                          userDetail: userDetail.category,
                          icon: Icons.medical_services_rounded,
                        ),
                        Row(
                          children: [
                            const Icon(
                              Icons.school,
                              color: AppColor.primary,
                            ),
                            const SizedBox(
                              width: 15,
                            ),
                            Text(
                              userDetail.qualifications,
                              style: const TextStyle(
                                fontSize: Sizes.s14,
                                color: AppColor.grey,
                              ),
                            ),
                          ],
                        ),
                        const Padding(
                          padding: EdgeInsets.symmetric(vertical: 5),
                          child: Divider(
                            thickness: 1,
                          ),
                        ),
                      ],
                    )
                  : const SizedBox(),
              Row(
                children: [
                  const Icon(
                    Icons.person,
                    color: AppColor.primary,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    userDetail.username,
                    style: const TextStyle(
                      fontSize: Sizes.s14,
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  thickness: 1,
                ),
              ),
              Row(
                children: [
                  const Icon(
                    Icons.email,
                    color: AppColor.primary,
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Text(
                    userDetail.email,
                    style: const TextStyle(
                      fontSize: Sizes.s14,
                      color: AppColor.grey,
                    ),
                  ),
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 5),
                child: Divider(
                  thickness: 1,
                ),
              ),
              InkWell(
                onTap: () {
                  HapticFeedback.mediumImpact();
                  context.push(AppRoutes.changepass);
                },
                child: Row(
                  children: const [
                    Icon(
                      Icons.password,
                      color: AppColor.primary,
                    ),
                    SizedBox(
                      width: 15,
                    ),
                    Text(
                      'Change Password',
                      style: TextStyle(
                        fontSize: Sizes.s14,
                        color: AppColor.grey,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
