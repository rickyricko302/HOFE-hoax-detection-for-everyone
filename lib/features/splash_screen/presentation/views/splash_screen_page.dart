import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/features/auth/data/datasource/auth_local_datasource.dart';
import 'package:hofe/features/auth/presentation/views/login_page.dart';
import 'package:hofe/features/hoax_news/presentation/views/home_page.dart';

import '../../../../injection.dart';

class SplashScreenPage extends StatefulWidget {
  const SplashScreenPage({super.key});

  @override
  State<SplashScreenPage> createState() => _SplashScreenPageState();
}

class _SplashScreenPageState extends State<SplashScreenPage> {
  double opacity = 0;

  @override
  void initState() {
    super.initState();
    WidgetsFlutterBinding.ensureInitialized().addPostFrameCallback((duration) {
      setState(() {
        opacity = 1;
      });
    });
    Future.delayed(const Duration(milliseconds: 3000), () {
      ensureUserLogged();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 1000),
              width: opacity > 0.5 ? 350 : 0,
              height: opacity > 0.5 ? 350 : 0,
              child: AnimatedOpacity(
                duration: const Duration(milliseconds: 1500),
                opacity: opacity,
                child: Image.asset('assets/images/icon.png'),
              ),
            ),
          )
        ],
      ),
    );
  }

  Future<void> ensureUserLogged() async {
    final AuthLocalDatasource authLocalDatasource = locator();
    final String? token = await authLocalDatasource.getToken();
    log("> token ${token.toString()}");
    final isUserLogged = token != null;
    if (mounted) {
      if (isUserLogged) {
        context.go(HomePage.routeName);
      } else {
        context.go(LoginPage.routeName);
      }
    }
  }
}
