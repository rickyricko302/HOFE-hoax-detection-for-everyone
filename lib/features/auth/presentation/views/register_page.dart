import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/data/constant.dart';
import 'package:hofe/features/auth/data/model/register_model_post.dart';
import 'package:hofe/shared-widgets/nunito_text.dart';
import 'package:hofe/shared-widgets/primary_button.dart';
import 'package:hofe/shared-widgets/text_field_forms.dart';
import 'package:hofe/utils/toast_helper.dart';

import '../../../../shared-widgets/password_field_forms.dart';
import '../bloc/register/register_bloc.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});
  static const routeName = '/register';

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
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
                text: 'Buat Akun',
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
                          name: 'Username',
                          controller: usernameController,
                          isRequired: true),
                      const Gap(16),
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
                      BlocBuilder<RegisterBloc, RegisterState>(
                        builder: (context, state) {
                          return PrimaryButton(
                            text: 'Mendaftar',
                            onClick: submitRegister,
                            isLoading: state is RegisterLoading,
                          );
                        },
                      ),
                      const Gap(8),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const NunitoText(
                              text: 'sudah punya akun?', fontSize: 14),
                          InkWell(
                            onTap: () {
                              context.pop();
                            },
                            child: const Padding(
                              padding: EdgeInsets.symmetric(horizontal: 4),
                              child: NunitoText(
                                text: 'Masuk',
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
            BlocListener<RegisterBloc, RegisterState>(
              listener: (context, state) {
                log(state.toString());
                if (state is RegisterSuccess) {
                  ToastHelper.showSuccess(message: 'Berhasil mendaftar.');
                  context.pop();
                } else if (state is RegisterFailed) {
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

  void submitRegister() {
    final bool isFormFilled = formKey.currentState?.validate() ?? false;
    if (isFormFilled) {
      final RegisterModelPost data = RegisterModelPost(
          username: usernameController.text,
          email: emailController.text,
          password: passwordController.text);
      FocusScope.of(context).unfocus();
      context.read<RegisterBloc>().add(OnRegister(data: data));
    }
  }
}
