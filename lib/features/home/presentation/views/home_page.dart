import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hofe/data/constant.dart';
import 'package:hofe/features/home/presentation/cubit/home_navigation_cubit.dart';
import 'package:hofe/features/home/presentation/views/widgets/home_view.dart';
import 'package:hofe/shared-widgets/nunito_text.dart';
import 'package:shimmer/shimmer.dart';

import 'widgets/home_bottom_navigation.dart';
import 'widgets/home_fab.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  static String routeName = '/home';

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          toolbarHeight: 0,
          backgroundColor: Colors.white,
          elevation: 0,
        ),
        extendBody: true,
        body: BlocListener<HomeNavigationCubit, int>(
          listener: (context, activePage) {
            pageController.animateToPage(activePage,
                duration: const Duration(milliseconds: 500),
                curve: Curves.linear);
          },
          child: PageView(
            controller: pageController,
            physics: const NeverScrollableScrollPhysics(),
            children: [HomeView(), Text('2')],
          ),
        ),
        floatingActionButton: const HomeFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const HomeBottomNavigation());
  }
}
