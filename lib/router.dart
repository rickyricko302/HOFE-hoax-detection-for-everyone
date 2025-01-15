import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/features/auth/presentation/views/login_page.dart';
import 'package:hofe/features/auth/presentation/views/register_page.dart';
import 'package:hofe/features/splash_screen/presentation/views/splash_screen_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final routerConfig = GoRouter(navigatorKey: navigatorKey, routes: [
  GoRoute(
    path: '/',
    builder: (context, state) => const SplashScreenPage(),
  ),
  GoRoute(
    path: '/login',
    name: LoginPage.routeName,
    builder: (context, state) => const LoginPage(),
  ),
  GoRoute(
    path: '/register',
    name: RegisterPage.routeName,
    builder: (context, state) => const RegisterPage(),
  )
]);
