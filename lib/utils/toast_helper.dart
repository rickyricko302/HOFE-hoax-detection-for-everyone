import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hofe/data/constant.dart';

import '../router.dart';

class ToastHelper {
  static FToast fToast = FToast();
  static Future<dynamic> showSuccess({required String message}) async {
    final BuildContext? context = navigatorKey.currentState?.context;
    if (context == null) {
      return await Fluttertoast.showToast(
          backgroundColor: green, textColor: white, msg: message);
    }
    fToast.init(context);
    return fToast.showToast(
        toastDuration: const Duration(seconds: 4),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
                color: green, borderRadius: BorderRadius.circular(8)),
            child: Text(message,
                textAlign: TextAlign.center,
                style: const TextStyle(color: white))));
  }

  static Future<dynamic> showError({required String message}) async {
    final BuildContext? context = navigatorKey.currentState?.context;
    if (context == null) {
      return await Fluttertoast.showToast(
          backgroundColor: red, textColor: white, msg: message);
    }
    fToast.init(context);
    return fToast.showToast(
        toastDuration: const Duration(seconds: 4),
        child: Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
            decoration: BoxDecoration(
                color: red, borderRadius: BorderRadius.circular(8)),
            child: Text(
              message,
              textAlign: TextAlign.center,
              style: const TextStyle(color: white),
            )));
  }
}
