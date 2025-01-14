import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/features/auth/data/model/login_model_post.dart';
import 'package:hofe/features/auth/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:hofe/features/auth/presentation/views/register_page.dart';
import 'package:hofe/router.dart';

import '../../../../data/constant.dart';
import '../../../../shared-widgets/nunito_text.dart';
import '../../../../shared-widgets/password_field_forms.dart';
import '../../../../shared-widgets/primary_button.dart';
import '../../../../shared-widgets/text_field_forms.dart';
import '../../../../utils/toast_helper.dart';
import '../bloc/register/register_bloc.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});
  static String routeName = '/login';
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 0,
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          children: [
            const Gap(64),
            const Center(
              child: NunitoText(
                text: 'Masuk',
                fontSize: 32,
                color: primary,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Center(
              child: NunitoText(
                text: 'Silakan lengkapi form dibawah ini untuk memebuat akun.',
                fontSize: 14,
                color: grey,
                textAlign: TextAlign.center,
              ),
            ),
            const Gap(24),
            Expanded(
              child: SingleChildScrollView(
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      MyFormField(
                          name: 'Email',
                          controller: emailController,
                          textInputType: TextInputType.emailAddress,
                          isRequired: true),
                      const Gap(16),
                      MyPasswordFormField(
                          name: 'Password',
                          controller: passwordController,
                          textInputType: TextInputType.emailAddress,
                          inputAction: TextInputAction.done,
                          isRequired: true),
                      const Gap(32),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return PrimaryButton(
                            text: 'Masuk',
                            onClick: submitLogin,
                            isLoading: state is LoginLoading,
                          );
                        },
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const NunitoText(
                              text: 'belum punya akun?', fontSize: 14),
                          InkWell(
                            onTap: () {
                              context.pushNamed(RegisterPage.routeName);
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: NunitoText(
                                text: 'Daftar',
                                fontSize: 14,
                                color: primary,
                              ),
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
            BlocListener<LoginBloc, LoginState>(
              listener: (context, state) {
                log(state.toString());
                if (state is LoginSuccess) {
                  ToastHelper.showSuccess(message: 'Berhasil mendaftar.');
                } else if (state is LoginFailed) {
                  ToastHelper.showError(message: state.exception.messageError);
                }
              },
              child: Container(),
            )
          ],
        ),
      ),
    );
  }

  void submitLogin() {
    final bool isFormFilled = formKey.currentState?.validate() ?? false;
    if (isFormFilled) {
      final LoginModelPost data = LoginModelPost(
          email: emailController.text, password: passwordController.text);
      context.read<LoginBloc>().add(OnLogin(data: data));
    }
  }
}
