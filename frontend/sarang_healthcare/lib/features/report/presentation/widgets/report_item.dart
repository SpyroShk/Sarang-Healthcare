import 'package:dio/dio.dart';
import 'package:downloads_path_provider_28/downloads_path_provider_28.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';

import '../../../../core/presentation/theme/app_color.dart';
import '../../../../core/presentation/theme/sizes.dart';
import '../../domain/report_model.dart';

class ReportItem extends StatelessWidget {
  const ReportItem({super.key, required this.report});
  final ReportModel report;

  @override
  Widget build(BuildContext context) {
    String filename = Uri.parse(report.report).pathSegments.last;
    return Container(
      height: 200,
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(30),
        color: AppColor.appointmentCard,
      ),
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Expanded(
                  child: Text(
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                    filename,
                    style: GoogleFonts.inter(
                      fontSize: Sizes.s20,
                      fontWeight: FontWeight.bold,
                      color: AppColor.secondary,
                    ),
                  ),
                ),
                Container(
                  padding: EdgeInsets.zero,
                  child: IconButton(
                    icon: const Icon(
                      Icons.download_outlined,
                      size: 30,
                      color: AppColor.primary,
                    ),
                    onPressed: () {
                      downloadFile(context, report.report, filename);
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 15,
            ),
            Container(
              height: 70,
              padding:
                  const EdgeInsets.symmetric(vertical: 8, horizontal: 10),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: AppColor.primary.withOpacity(0.3),
              ),
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.zero,
                    child: const Icon(
                      Icons.report_outlined,
                      size: 20,
                      color: AppColor.primary,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 70,
                      child: SingleChildScrollView(
                        physics: const BouncingScrollPhysics(),
                        child: Text(
                          // maxLines: 5,
                          // overflow: TextOverflow.ellipsis,
                          report.remarks,
                          style: GoogleFonts.inter(
                            fontSize: Sizes.s14,
                            fontWeight: FontWeight.bold,
                            color: AppColor.secondary,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> downloadFile(
      BuildContext context, String url, String filename) async {
    Dio dio = Dio();
    try {
      // Get the app's temporary directory
      final dir = await DownloadsPathProvider.downloadsDirectory;

      if (dir != null) {
        // Define the file path
        final path = '${dir.path}/$filename';

        // Download the file
        await dio.download(url, path);
        context.showCustomSnackBar(
            message: 'File downloaded successfully at $path!', result: true);
      } else {
        context.showCustomSnackBar(
            message: 'Failed to get external storage directory.',
            result: false);
      }
    } catch (e) {
      context.showCustomSnackBar(
          message: 'Failed to download file: $e', result: false);
    }
  }
}
