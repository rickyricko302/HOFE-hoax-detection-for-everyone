import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/features/auth/presentation/views/login_page.dart';
import 'package:hofe/features/auth/presentation/views/register_page.dart';
import 'package:hofe/features/detect_hoax/presentations/views/detect_hoax_page.dart';
import 'package:hofe/features/hoax_news/presentation/views/home_page.dart';
import 'package:hofe/features/splash_screen/presentation/views/splash_screen_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final routerConfig = GoRouter(navigatorKey: navigatorKey, routes: [
  GoRoute(
    path: '/',
    name: '/',
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
  ),
  GoRoute(
    path: '/home',
    name: HomePage.routeName,
    builder: (context, state) => const HomePage(),
  ),
  GoRoute(
    path: '/detect-hoax',
    name: DetectHoaxPage.routeName,
    builder: (context, state) => const DetectHoaxPage(),
  ),
]);
