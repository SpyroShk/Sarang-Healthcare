import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sarang_healthcare/core/presentation/theme/app_color.dart';
import 'package:sarang_healthcare/core/presentation/theme/gradient_bg.dart';
import 'package:sarang_healthcare/core/presentation/theme/sizes.dart';
import 'package:sarang_healthcare/core/presentation/widgets/sarang_button.dart';
import 'package:sarang_healthcare/features/signup/presentation/widgets/re_password_field.dart';
import 'package:sarang_healthcare/features/signup/presentation/widgets/username.dart';

import '../../../core/presentation/widgets/widgets.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final formKey = GlobalKey<FormState>();
  final userNameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  bool isChecked = false;
  double show = 0;

  @override
  void dispose() {
    userNameController.dispose();
    emailController.dispose();
    passwordController.dispose();
    rePasswordController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 800), () {
      if (show == 0) {
        setState(() {
          show = 1;
        });
      }
    });
    // context.read<AuthCubit>().getUser(emailController);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GradientBg(
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.10),
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
              ),
              width: double.infinity,
              height: MediaQuery.of(context).size.height * 0.99,
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
                      child: Hero(
                        tag: 'logo',
                        child: Image.asset(
                          "assets/logo.png",
                          width: 300,
                        ),
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
                          'Welcome!',
                          style: TextStyle(
                            fontSize: Sizes.s32,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                        ),
                        const Text(
                          'Create an account.',
                          style: TextStyle(
                            fontSize: Sizes.s20,
                            fontWeight: FontWeight.w400,
                            color: AppColor.grey,
                          ),
                        ),
                        const SizedBox(
                          height: 24,
                        ),
                        UserNameField(
                          userNameController: userNameController,
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 16,
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
                          textInputAction: TextInputAction.next,
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        RePasswordField(
                          passwordController: passwordController,
                          rePasswordController: rePasswordController,
                          textInputAction: TextInputAction.send,
                        ),
                        const SizedBox(
                          height: 50,
                        ),
                        SarangButton(
                          onPressed: signupHandler,
                          isLoading: false,
                          label: 'Sign Up',
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Already have an account?  ",
                              style: TextStyle(
                                fontSize: Sizes.s14,
                              ),
                            ),
                            InkWell(
                              onTap: () => Navigator.of(context).pop(),
                              child: const Text(
                                "Sign In",
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

  void signupHandler() {
    if (formKey.currentState!.validate()) {
      // final email =
      emailController.text.trim();
      // final password =
      passwordController.text.trim();
      rePasswordController.text.trim();
      // context.read<AuthCubit>().login(
      //       rememberMe: isChecked,
      //       email: email,
      //       password: password,
      //     );
    }
  }
}
