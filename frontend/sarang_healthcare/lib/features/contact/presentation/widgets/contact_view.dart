import 'package:flutter/material.dart';
import 'package:sarang_healthcare/features/contact/presentation/widgets/contact_view_details.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../domain/contact_model.dart';

class ContactView extends StatelessWidget {
  final List<ContactModel> contactModel;
  const ContactView({super.key, required this.contactModel});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      physics: const NeverScrollableScrollPhysics(),
      padding: EdgeInsets.zero,
      shrinkWrap: true,
      itemCount: contactModel.length,
      itemBuilder: (context, index) {
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
                  ContactViewDetails(
                    contactDetails: contactModel[index].phone.toString(),
                    icon: Icons.home_outlined,
                  ),
                  ContactViewDetails(
                    contactDetails: contactModel[index].mobile.toString(),
                    icon: Icons.phone_outlined,
                  ),
                  ContactViewDetails(
                    contactDetails: contactModel[index].sm1,
                    icon: Icons.web_outlined,
                  ),
                  ContactViewDetails(
                    contactDetails: contactModel[index].email,
                    icon: Icons.email_outlined,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        color: AppColor.primary,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          contactModel[index].location,
                          style: const TextStyle(
                            fontSize: Sizes.s14,
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Text(
                'Social Accounts',
                style: TextStyle(
                  fontSize: Sizes.s14,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
            ),
            const SizedBox(
              height: 10,
            ),
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
                  ContactViewDetails(
                    contactDetails: contactModel[index].sm2,
                    icon: Icons.facebook_outlined,
                  ),
                  ContactViewDetails(
                    contactDetails: contactModel[index].sm3,
                    icon: Icons.message_outlined,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.camera_enhance_outlined,
                        color: AppColor.primary,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      SizedBox(
                        width: 250,
                        child: Text(
                          contactModel[index].sm4,
                          style: const TextStyle(
                            fontSize: Sizes.s14,
                            color: AppColor.grey,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        );
      },
    );
  }
}
