import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/data/constant.dart';
import 'package:hofe/features/detect_hoax/presentations/cubit/detect_hoax_cubit.dart';
import 'package:hofe/shared-widgets/nunito_text.dart';
import 'package:hofe/shared-widgets/primary_button.dart';
import 'package:hofe/utils/toast_helper.dart';

import '../../../../utils/exceptions.dart';
import '../../../auth/presentation/views/login_page.dart';

class DetectHoaxPage extends StatefulWidget {
  const DetectHoaxPage({super.key});
  static String routeName = '/detect-hoax';

  @override
  State<DetectHoaxPage> createState() => _DetectHoaxPageState();
}

class _DetectHoaxPageState extends State<DetectHoaxPage> {
  final TextEditingController textNews = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const NunitoText(
          text: "Deteksi Hoax",
          fontSize: 22,
          fontWeight: FontWeight.bold,
        ),
      ),
      resizeToAvoidBottomInset: false,
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const NunitoText(
              text: 'Isi atau tempelkan teks berita disini',
              fontSize: 14,
              color: grey,
            ),
            const Gap(12),
            Expanded(
              child: TextField(
                controller: textNews,
                maxLines: null,
                expands: true,
                textAlignVertical: TextAlignVertical.top,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  labelStyle: const TextStyle(fontSize: 16),
                ),
              ),
            ),
            const Gap(20),
            BlocBuilder<DetectHoaxCubit, DetectHoaxState>(
              builder: (context, state) {
                log(state.toString());
                return PrimaryButton(
                    text: "Deteksi",
                    onClick: () {
                      String text = textNews.text;
                      if (text.isNotEmpty) {
                        context.read<DetectHoaxCubit>().detectHoax(text: text);
                      } else {
                        ToastHelper.showError(message: 'Teks wajib diisi!');
                      }
                    },
                    isLoading: state is DetectHoaxLoading);
              },
            ),
            BlocListener<DetectHoaxCubit, DetectHoaxState>(
              listener: (context, state) {
                if (state is DetectHoaxError) {
                  ToastHelper.showError(message: state.exception.messageError);
                  if (state.exception is UnauthorizedException) {
                    context.goNamed(LoginPage.routeName);
                  }
                } else if (state is DetectHoaxSuccess) {
                  showDialog(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          title: const NunitoText(
                            text: "Hasil Deteksi",
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                          ),
                          content: NunitoText(
                            text: state.data.result?.prediction ?? '-',
                            fontSize: 16,
                            color: Colors.black,
                          ),
                          actions: [
                            PrimaryButton(
                              isLoading: false,
                              onClick: () {
                                Navigator.pop(context);
                              },
                              text: 'Tutup',
                            ),
                          ],
                        );
                      });
                }
              },
              child: Container(),
            )
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    textNews.dispose();
    super.dispose();
  }
}
