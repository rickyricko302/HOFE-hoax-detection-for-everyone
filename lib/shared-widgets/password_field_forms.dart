import 'package:flutter/material.dart';
import 'package:hofe/shared-widgets/nunito_text.dart';

import '../data/constant.dart';

class MyPasswordFormField extends StatefulWidget {
  const MyPasswordFormField(
      {super.key,
      required this.name,
      required this.controller,
      required this.isRequired,
      this.enable = true,
      this.inputAction = TextInputAction.next,
      this.textInputType = TextInputType.text});
  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction inputAction;
  final bool isRequired;
  final String name;
  final bool enable;

  @override
  State<MyPasswordFormField> createState() => _MyPasswordFormFieldState();
}

class _MyPasswordFormFieldState extends State<MyPasswordFormField> {
  bool isPasswordShow = false;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisSize: MainAxisSize.min,
      children: [
        Row(
          children: [
            NunitoText(
              text: widget.name,
              fontSize: 14,
              color: text,
            ),
            Visibility(
              visible: widget.isRequired,
              child: NunitoText(
                text: '*',
                fontSize: 14,
                color: orange,
              ),
            )
          ],
        ),
        TextFormField(
          controller: widget.controller,
          textInputAction: widget.inputAction,
          keyboardType: widget.textInputType,
          enabled: widget.enable,
          obscureText: !isPasswordShow,
          validator: widget.isRequired
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
              suffixIcon: IconButton(
                  onPressed: () {
                    setState(() {
                      isPasswordShow = !isPasswordShow;
                    });
                  },
                  icon: Icon(isPasswordShow
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined)),
              focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12),
                  borderSide: const BorderSide(color: primary, width: 2))),
        ),
      ],
    );
  }
}
