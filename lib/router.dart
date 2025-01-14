import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/features/auth/presentation/views/register_page.dart';

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

final routerConfig = GoRouter(navigatorKey: navigatorKey, routes: [
  GoRoute(
    path: '/',
    name: RegisterPage.routeName,
    builder: (context, state) => const RegisterPage(),
  )
]);
