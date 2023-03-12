import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_appbar.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/widgets/connection_lost.dart';
import '../application/cubit/contact_cubit.dart';
import 'widgets/widgets.dart';

class Contact extends StatefulWidget {
  const Contact({super.key});

  @override
  State<Contact> createState() => _ContactState();
}

class _ContactState extends State<Contact> {
  @override
  void initState() {
    super.initState();
    context.read<ContactCubit>().getContactDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(
          children: [
            SarangAppbar(
              title: 'Contact',
              leading: IconButton(
                icon: const Icon(
                  Icons.arrow_back_ios_new_rounded,
                  color: AppColor.canvas,
                ),
                onPressed: () => context.pop(),
              ),
            ),
            CanvasCard(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 30),
                    child: Image.asset(
                      "assets/logo.png",
                      width: 300,
                    ),
                  ),
                  BlocBuilder<ContactCubit, ContactState>(
                    builder: (context, state) {
                      return state.maybeWhen(
                        loadedCache: (contactModel) {
                          return ContactView(contactModel: contactModel);
                        },
                        loadedNetwork: (contactModel) {
                          return ContactView(contactModel: contactModel);
                        },
                        loading: () => CircularProgressIndicator(),
                        notLoaded: (message) {
                          return ConnectionLost(
                            onRetry: () {
                              context.read<ContactCubit>().getContactDetail();
                            },
                          );
                        },
                        orElse: () => const SizedBox.shrink(),
                      );
                    },
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
