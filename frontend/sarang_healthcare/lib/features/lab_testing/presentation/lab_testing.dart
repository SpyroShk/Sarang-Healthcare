import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/features/lab_testing/presentation/home_service.dart';
import 'package:sarang_healthcare/features/lab_testing/presentation/on_site.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../lab_tests/domain/lab_tests_model.dart';

class LabTesting extends StatefulWidget {
  const LabTesting({
    super.key,
    required this.selectedLabTests,
  });
  final List<LabTestsModel> selectedLabTests;

  @override
  State<LabTesting> createState() => _LabTestingState();
}

List<String> tabNames = ['On Site', 'Home Service'];

class _LabTestingState extends State<LabTesting>
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
            SarangAppbar(
              title: 'Book for Lab testing',
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.canvas,
                ),
                onPressed: () => context.pop(),
              ),
            ),
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
                      controller: _tabController,
                      children: [
                        OnSite(
                          selectedLabTests: widget.selectedLabTests,
                          tabName: tabNames[_selectedTabIndex],
                        ),
                        HomeService(
                          selectedLabTests: widget.selectedLabTests,
                          tabName: tabNames[_selectedTabIndex],
                        ),
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
