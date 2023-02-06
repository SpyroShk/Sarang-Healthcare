import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../domain/user_detail.dart';

class ProfileView extends StatelessWidget {
  final UserDetail userDetail;
  const ProfileView({super.key, required this.userDetail});

  @override
  Widget build(BuildContext context) {
    return Container(
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
        ],
      ),
    );
  }
}
