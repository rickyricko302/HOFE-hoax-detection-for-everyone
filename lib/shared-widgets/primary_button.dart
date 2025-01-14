import 'package:flutter/material.dart';

import '../../data/constant.dart';
import 'nunito_text.dart';

class PrimaryButton extends StatelessWidget {
  const PrimaryButton(
      {super.key,
      required this.text,
      required this.onClick,
      required this.isLoading});
  final VoidCallback onClick;
  final bool isLoading;
  final String text;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 48,
      child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              backgroundColor: primary,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12))),
          onPressed: isLoading ? null : onClick,
          child: isLoading
              ? const Center(
                  child: SizedBox(
                    width: 24,
                    height: 24,
                    child: CircularProgressIndicator(
                      color: orange,
                      strokeWidth: 3,
                    ),
                  ),
                )
              : NunitoText(
                  text: text,
                  maxLines: 1,
                  fontSize: 16,
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                )),
    );
  }
}
