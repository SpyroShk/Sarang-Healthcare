import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:sarang_healthcare/core/presentation/route/app_router.dart';
import 'package:sarang_healthcare/core/presentation/theme/app_color.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/core/shared/context/show_toast.dart';
import 'package:sarang_healthcare/features/login/application/cubit/login_cubit.dart';

import '../../../core/presentation/widgets/widgets.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  double show = 0;

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      //asynchronous delay
      if (show == 0) {
        setState(() {
          show = 1;
        });
      }
    });
    context.read<LoginCubit>().getUser(emailController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.20),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.85,
              decoration: const BoxDecoration(
                color: AppColor.canvas,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              child: Column(
                children: [
                  Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 20),
                      child: Image.asset(
                        "assets/logo.png",
                        width: 300,
                      ),
                    ),
                  ),
                  AnimatedOpacity(
                    duration: const Duration(milliseconds: 800),
                    opacity: show,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Hello!',
                          style: TextStyle(
                            fontSize: Sizes.s32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const Text(
                          'Welcome back',
                          style: TextStyle(
                            fontSize: Sizes.s20,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        EmailField(
                          emailcontroller: emailController,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        PasswordField(
                          passwordcontroller: passwordController,
                          textInputAction: TextInputAction.send,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        const Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            'Forgot Password?',
                            style: TextStyle(
                              fontSize: Sizes.s12,
                              fontWeight: FontWeight.w900,
                              color: AppColor.primary,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Stack(
                          children: [
                            BlocListener<LoginCubit, LoginState>(
                              listener: (context, state) {
                                state.whenOrNull(
                                  unauthenticated: (message) =>
                                      context.showCustomSnackBar(
                                    result: false,
                                    message: message,
                                  ),
                                );
                              },
                              child: BlocBuilder<LoginCubit, LoginState>(
                                builder: (context, state) {
                                  return SarangButton(
                                    onPressed: loginHandler,
                                    isLoading: state.maybeWhen(
                                      orElse: () => false,
                                      loading: () => true,
                                    ),
                                    label: 'Sign In',
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Don't have an account?  ",
                              style: TextStyle(
                                fontSize: Sizes.s14,
                              ),
                            ),
                            InkWell(
                              onTap: () => context.push(AppRoutes.signup),
                              // Navigator.of(context).push(
                              //   PageRouteBuilder(
                              //     transitionDuration:
                              //         const Duration(seconds: 2),
                              //     pageBuilder: (context, animation,
                              //             secondaryAnimation) =>
                              //         const SignUpScreen(),
                              //   ),
                              // );
                              child: const Text(
                                "Sign Up",
                                style: TextStyle(
                                  fontSize: Sizes.s14,
                                  fontWeight: FontWeight.w900,
                                  color: AppColor.primary,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void loginHandler() {
    HapticFeedback.mediumImpact();
    if (formKey.currentState!.validate()) {
      final usernameEmail = emailController.text.trim();
      final password = passwordController.text.trim();
      context.read<LoginCubit>().login(
            usernameEmail: usernameEmail,
            password: password,
          );
    }
  }
}
