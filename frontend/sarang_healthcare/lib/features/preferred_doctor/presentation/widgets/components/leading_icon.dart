import 'dart:developer';

import 'package:circular_profile_avatar/circular_profile_avatar.dart';
import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/shared/api_constants.dart';

import '../../../domain/preferred_doctor_model.dart';

class LeadingIcon extends StatefulWidget {
  const LeadingIcon({super.key, required this.preferredDoctor});
  final PreferredDoctorModel preferredDoctor;

  @override
  State<LeadingIcon> createState() => _LeadingIconState();
}

class _LeadingIconState extends State<LeadingIcon> {
  @override
  Widget build(BuildContext context) {
    log(widget.preferredDoctor.image);
    return CircularProfileAvatar(
      "${ApiConstants.baseUrl}/media/${widget.preferredDoctor.image}",
      errorWidget: (context, url, error) => const Icon(Icons.error),
      placeHolder: (context, url) => const SizedBox(
        width: 50,
        height: 50,
        child: CircularProgressIndicator(),
      ),
      radius: 40,
      backgroundColor: Colors.transparent,
      cacheImage: true,
      showInitialTextAbovePicture: false,
    );
  }
}
