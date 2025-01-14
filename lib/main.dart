import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hofe/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hofe/injection.dart';
import 'package:hofe/router.dart';

void main() async {
  await initGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => RegisterBloc(userRegisterUsecase: locator()),
      child: MaterialApp.router(
        routerConfig: routerConfig,
        builder: FToastBuilder(),
        title: "Hoax News",
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: false,
            colorSchemeSeed: Colors.green),
      ),
    );
  }
}
