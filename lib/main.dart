import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hofe/data/constant.dart';
import 'package:hofe/features/auth/presentation/bloc/login/bloc/login_bloc.dart';
import 'package:hofe/features/auth/presentation/bloc/register/register_bloc.dart';
import 'package:hofe/features/detect_hoax/presentations/cubit/detect_hoax_cubit.dart';
import 'package:hofe/features/hoax_news/presentation/bloc/hoax_news_bloc.dart';
import 'package:hofe/features/hoax_news/presentation/cubit/home_navigation_cubit.dart';
import 'package:hofe/injection.dart';
import 'package:hofe/router.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initGetIt();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => locator<RegisterBloc>(),
        ),
        BlocProvider(create: (context) => locator<LoginBloc>()),
        BlocProvider(create: (context) => locator<HomeNavigationCubit>()),
        BlocProvider(create: (context) => locator<HoaxNewsBloc>()),
        BlocProvider(create: (context) => locator<DetectHoaxCubit>()),
      ],
      child: MaterialApp.router(
        routerConfig: routerConfig,
        builder: FToastBuilder(),
        title: "Hoax News",
        theme: ThemeData(
            scaffoldBackgroundColor: Colors.white,
            useMaterial3: false,
            appBarTheme: const AppBarTheme(backgroundColor: primary),
            colorSchemeSeed: Colors.green),
      ),
    );
  }
}
