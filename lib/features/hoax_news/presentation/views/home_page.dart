import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hofe/features/hoax_news/presentation/cubit/home_navigation_cubit.dart';
import 'package:hofe/features/hoax_news/presentation/views/widgets/home_view.dart';

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
            children: const [HomeView(), Text('2')],
          ),
        ),
        floatingActionButton: const HomeFab(),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
        bottomNavigationBar: const HomeBottomNavigation());
  }
}
