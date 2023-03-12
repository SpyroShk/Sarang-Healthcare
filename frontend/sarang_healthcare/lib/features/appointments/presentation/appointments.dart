import 'package:flutter/material.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/features/appointment_list/presentation/appointment_list.dart';
import 'package:sarang_healthcare/features/lab_testing_list/presentation/lab_testing_list.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/theme/sizes.dart';
import '../../../core/presentation/widgets/canvas_card.dart';
import '../../../core/presentation/widgets/sarang_appbar.dart';

class Appointments extends StatefulWidget {
  const Appointments({super.key});

  @override
  State<Appointments> createState() => _AppointmentsState();
}

List<String> tabNames = ['Doctor', 'Lab Testing'];

class _AppointmentsState extends State<Appointments>
    with SingleTickerProviderStateMixin {
  late final TabController _tabController;
  int _selectedTabIndex = 0;
  @override
  void initState() {
    _tabController = TabController(length: tabNames.length, vsync: this);
    super.initState();
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Appointments'),
            Container(
              height: 55,
              margin: const EdgeInsets.symmetric(horizontal: 50, vertical: 20),
              padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 6),
              decoration: BoxDecoration(
                color: AppColor.canvas,
                borderRadius: BorderRadius.circular(30),
              ),
              child: TabBar(
                enableFeedback: true,
                labelColor: AppColor.canvas,
                unselectedLabelColor: AppColor.grey,
                controller: _tabController,
                labelPadding: const EdgeInsets.symmetric(horizontal: 10),
                indicator: BoxDecoration(
                  borderRadius: BorderRadius.circular(30),
                  color: AppColor.primary,
                ),
                onTap: (index) {
                  setState(() {
                    _selectedTabIndex = index;
                  });
                },
                tabs: tabNames.map(
                  (tabName) {
                    return Tab(
                      child: Text(
                        tabName,
                        style: const TextStyle(
                            fontWeight: FontWeight.w600, fontSize: Sizes.s14),
                      ),
                    );
                  },
                ).toList(),
              ),
            ),
            CanvasCard(
              child: Column(
                children: [
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      controller: _tabController,
                      children: const [
                        AppointmentList(),
                        LabTestingList(),
                      ],
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
}
