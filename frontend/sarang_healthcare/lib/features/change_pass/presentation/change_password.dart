import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/widgets/canvas_card.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';

import '../../../core/presentation/theme/app_color.dart';
import '../../../core/presentation/widgets/sarang_appbar.dart';
import '../../../core/presentation/widgets/widgets.dart';
import '../../login/application/cubit/login_cubit.dart';
import '../../signup/presentation/widgets/re_password_field.dart';
import '../application/cubit/change_password_cubit.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final formKey = GlobalKey<FormState>();
  final oldPasswordController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();

  @override
  void dispose() {
    oldPasswordController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Column(children: [
          SarangAppbar(
            title: 'Change Password',
            leading: IconButton(
              icon: const Icon(
                Icons.arrow_back_ios_new_rounded,
                color: AppColor.canvas,
              ),
              onPressed: () {
                HapticFeedback.mediumImpact();
                context.pop();
              },
            ),
          ),
          CanvasCard(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Container(
                  padding: const EdgeInsets.symmetric(vertical: 30),
                  child: Column(
                    children: [
                      OldPasswordField(
                        passwordcontroller: oldPasswordController,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      NewPasswordField(
                        passwordcontroller: passwordController,
                        textInputAction: TextInputAction.next,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      ReNewPasswordField(
                        passwordController: passwordController,
                        rePasswordController: rePasswordController,
                        textInputAction: TextInputAction.send,
                      ),
                      const SizedBox(
                        height: 40,
                      ),
                      Stack(
                        children: [
                          BlocListener<ChangePasswordCubit,
                              ChangePasswordState>(
                            listener: (context, state) {
                              state.whenOrNull(
                                  unsucceeded: (message) =>
                                      context.showCustomSnackBar(
                                        result: false,
                                        message: message,
                                      ),
                                  succeeded: (message) {
                                    context.showCustomSnackBar(
                                      result: true,
                                      message: message,
                                    );
                                    context.read<LoginCubit>().logOut();
                                  });
                            },
                            child: BlocBuilder<ChangePasswordCubit,
                                ChangePasswordState>(
                              builder: (context, state) {
                                return SarangButton(
                                  onPressed: changeHandeler,
                                  isLoading: state.maybeWhen(
                                    orElse: () => false,
                                    loading: () => true,
                                  ),
                                  label: 'Change Password',
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          )
        ]),
      ),
    );
  }

  void changeHandeler() {
    HapticFeedback.mediumImpact();
    if (formKey.currentState!.validate()) {
      final oldPassword = oldPasswordController.text.trim();
      final password = passwordController.text.trim();
      final rePassword = rePasswordController.text.trim();
      context.read<ChangePasswordCubit>().changePassword(
            old_password: oldPassword,
            new_password1: password,
            new_password2: rePassword,
          );
    }
  }
}
