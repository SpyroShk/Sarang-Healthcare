import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/preferred_doctor/presentation/widgets/category_header.dart';

import '../../../core/presentation/widgets/connection_lost.dart';
import '../application/cubit/preferred_doctor_cubit.dart';
import '../domain/preferred_doctor_model.dart';
import 'widgets/components/components.dart';
import 'widgets/widgets.dart';

class PreferredDoctor extends StatefulWidget {
  const PreferredDoctor({super.key});

  @override
  State<PreferredDoctor> createState() => _PreferredDoctorState();
}

class _PreferredDoctorState extends State<PreferredDoctor> {
  CategoryType categoryType = CategoryType.paediatrician;
  String selectedCategory = "Paediatrician";

  void onCategoryChanged(String category) {
    switch (category) {
      case ("Paediatrician"):
        categoryType = CategoryType.paediatrician;
        break;
      case ("Orthopaedic"):
        categoryType = CategoryType.orthopaedic;
        break;
      case ("ENT specialist"):
        categoryType = CategoryType.entSpecialist;
        break;
      case ("Gynaecologist"):
        categoryType = CategoryType.gynaecologist;
        break;
      case ("Psychiatrist"):
        categoryType = CategoryType.psychiatrist;
        break;
      case ("Dermatologist"):
        categoryType = CategoryType.dermatologist;
        break;
    }
    selectedCategory = category;
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    context.read<PreferredDoctorCubit>().getPreferredDoctorDetail();
  }

  final ScrollController _scrollController = ScrollController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            const SarangAppbar(title: 'Doctors'),
            CanvasCard(
              child: BlocListener<PreferredDoctorCubit, PreferredDoctorState>(
                listener: (context, state) {
                  state.whenOrNull(
                    loadFailure: (message) => context.showCustomSnackBar(
                        message: message, result: false),
                  );
                },
                child: BlocBuilder<PreferredDoctorCubit, PreferredDoctorState>(
                  builder: (context, state) {
                    return state.maybeWhen(
                      loadedNetwork: (preferredDoctorList) {
                        return CustomScrollView(
                          slivers: [
                            SliverPersistentHeader(
                              floating: true,
                              delegate: PersitentHeader(
                                maxHeight: 90,
                                minHeight: 90,
                                child: Container(
                                  height: 42,
                                  margin: const EdgeInsets.only(
                                    top: 22,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(12),
                                    child: ListView(
                                      padding: EdgeInsets.zero,
                                      physics: const BouncingScrollPhysics(),
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        CategoryHeader(
                                          onCategoryChanged: onCategoryChanged,
                                          selectedCategory: selectedCategory,
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SliverFillRemaining(
                              child: PreferredDoctorList(
                                scrollController: _scrollController,
                                // preferredDoctorList: preferredDoctorList,
                                doctorCategory: selectedCategory,
                              ),
                            ),
                          ],
                        );
                      },
                      loading: () => const Center(
                        child: CircularProgressIndicator(),
                      ),
                      loadFailure: (message) {
                        return ConnectionLost(
                          onRetry: () {
                            context
                                .read<PreferredDoctorCubit>()
                                .getPreferredDoctorDetail();
                          },
                        );
                      },
                      orElse: () => const SizedBox.shrink(),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PreferredDoctorList extends StatelessWidget {
  // final List<PreferredDoctorModel> preferredDoctorList;
  final String doctorCategory;
  const PreferredDoctorList({
    Key? key,
    // required this.preferredDoctorList,
    required ScrollController scrollController,
    required this.doctorCategory,
  })  : _scrollController = scrollController,
        super(key: key);

  final ScrollController _scrollController;

  @override
  Widget build(BuildContext context) {
    final List<PreferredDoctorModel> preferredDoctor =
        context.watch<PreferredDoctorCubit>().changeDoctor(doctorCategory);
    return ListView.separated(
      physics: const BouncingScrollPhysics(),
      padding: const EdgeInsets.only(top: 0),
      controller: _scrollController,
      itemBuilder: (context, index) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            PreferredDoctorListItem(
              preferredDoctor: preferredDoctor[index],
            ),
          ],
        );
      },
      separatorBuilder: (context, index) {
        return const SizedBox(
          height: 18,
        );
      },
      itemCount: preferredDoctor.length,
    );
  }
}
