import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarang_healthcare/core/presentation/theme/app_color.dart';

import '../../../../../core/presentation/theme/sizes.dart';
import '../../../domain/lab_tests_model.dart';

class LabTestsTitle extends StatefulWidget {
  const LabTestsTitle(
      {super.key, required this.labTests, this.controller, this.validator});
  // final LabTestsModel labTests;
  final LabTestsModel? labTests;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  State<LabTestsTitle> createState() => _LabTestsTitleState();
}

class _LabTestsTitleState extends State<LabTestsTitle> {
  // @override
  // void initState() {
  //   super.initState();
  //   widget.controller!.text == widget.labTests?.testName ?? 'Testst';
  // }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 230,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // TextFormField(
          //   maxLines: 2,
          //   showCursor: false,
          //   readOnly: true,
          //   focusNode: AlwaysDisabledFocusNode(),
          //   controller: widget.controller,
          //   decoration: const InputDecoration(
          //     isDense: true,
          //     contentPadding: EdgeInsets.zero,
          //     border: InputBorder.none,
          //   ),
          //   style: GoogleFonts.inter(
          //     fontSize: Sizes.s20,
          //     fontWeight: FontWeight.bold,
          //   ),
          //   validator: widget.validator,
          // ),
          Text(
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            widget.labTests!.testName,
            style: GoogleFonts.inter(
              fontSize: Sizes.s20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(
            height: 5,
          ),
          Text(
            overflow: TextOverflow.ellipsis,
            "Rs. ${widget.labTests!.price.toString()}",
            style: GoogleFonts.inter(
              fontSize: Sizes.s14,
              color: AppColor.grey,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}

class AlwaysDisabledFocusNode extends FocusNode {
  @override
  bool get hasFocus => false;
}
