import 'package:flutter/material.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';

class ProfileViewDoc extends StatelessWidget {
  const ProfileViewDoc(
      {super.key, required this.userDetail, this.icon});

  final String userDetail;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Icon(
              icon,
              color: AppColor.primary,
            ),
            const SizedBox(
              width: 15,
            ),
            Text(
              userDetail,
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
    );
  }
}
