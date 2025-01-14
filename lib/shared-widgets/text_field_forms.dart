import 'package:flutter/material.dart';
import 'package:hofe/shared-widgets/nunito_text.dart';

import '../data/constant.dart';

class MyFormField extends StatelessWidget {
  const MyFormField(
      {super.key,
      required this.name,
      required this.controller,
      required this.isRequired,
      this.enable = true,
      this.textInputType = TextInputType.text});
  final TextEditingController controller;
  final TextInputType textInputType;
  final bool isRequired;
  final String name;
  final bool enable;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            NunitoText(
              text: name,
              fontSize: 14,
              color: text,
            ),
            Visibility(
              visible: isRequired,
              child: NunitoText(
                text: '*',
                fontSize: 14,
                color: orange,
              ),
            )
          ],
        ),
        TextFormField(
          controller: controller,
          textInputAction: TextInputAction.next,
          keyboardType: textInputType,
          enabled: enable,
          validator: isRequired
              ? (value) {
                  if (value?.isEmpty ?? true) {
                    return 'Kolom ini wajib diisi.';
                  }
                  return null;
                }
              : null,
          decoration: InputDecoration(
              filled: true,
              fillColor: bgForm,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(12),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary, width: 2))),
        ),
      ],
    );
  }
}
