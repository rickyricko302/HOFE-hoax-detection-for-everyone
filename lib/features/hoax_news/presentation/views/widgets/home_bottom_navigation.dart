import 'package:animated_bottom_navigation_bar/animated_bottom_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hofe/features/hoax_news/presentation/cubit/home_navigation_cubit.dart';

import '../../../../../data/constant.dart';
import '../../../../../shared-widgets/nunito_text.dart';

class HomeBottomNavigation extends StatelessWidget {
  const HomeBottomNavigation({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<HomeNavigationCubit, int>(
      builder: (context, pageActive) {
        return AnimatedBottomNavigationBar.builder(
            backgroundColor: primary,
            notchSmoothness: NotchSmoothness.smoothEdge,
            itemCount: 2,
            tabBuilder: (index, isActive) {
              if (index == 0) {
                return Opacity(
                  opacity: index == pageActive ? 1 : 0.8,
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {
                        context.read<HomeNavigationCubit>().setIndex(index: 0);
                      },
                      child: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          NunitoText(
                            text: 'Home',
                            fontSize: 12,
                            color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ),
                );
              }
              return Opacity(
                opacity: index == pageActive ? 1 : 0.8,
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    onTap: () {
                      context.read<HomeNavigationCubit>().setIndex(index: 1);
                    },
                    child: const Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.history,
                          color: Colors.white,
                        ),
                        NunitoText(
                          text: 'Riwayat',
                          fontSize: 12,
                          color: Colors.white,
                        )
                      ],
                    ),
                  ),
                ),
              );
            },
            gapLocation: GapLocation.center,
            activeIndex: 0,
            onTap: (index) {});
      },
    );
  }
}
