import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/features/auth/presentation/views/login_page.dart';
import 'package:hofe/features/hoax_news/data/model/hoax_news_model.dart';
import 'package:hofe/features/hoax_news/presentation/bloc/hoax_news_bloc.dart';
import 'package:hofe/features/hoax_news/presentation/views/widgets/home_circle_profile.dart';
import 'package:hofe/utils/exceptions.dart';
import 'package:hofe/utils/toast_helper.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../data/constant.dart';
import '../../../../../shared-widgets/nunito_text.dart';
import 'home_card_index.dart';
import 'home_card_top_hoax.dart';

class HomeView extends StatefulWidget {
  const HomeView({super.key});

  @override
  State<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView>
    implements AutomaticKeepAliveClientMixin<HomeView> {
  @override
  void initState() {
    super.initState();
    if (context.read<HoaxNewsBloc>().state is! HoaxNewsSuccess) {
      context.read<HoaxNewsBloc>().add(GetHoaxNewsEvent());
    }
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        context.read<HoaxNewsBloc>().add(GetHoaxNewsEvent());
      },
      child: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        NunitoText(
                          text: "Senin, 15 Januari 2025",
                          fontSize: 16,
                          color: grey,
                        ),
                        NunitoText(
                          text: "Top Hoax",
                          fontSize: 32,
                          color: text,
                          fontWeight: FontWeight.bold,
                        ),
                      ],
                    ),
                  ),
                  HomeCircleProfile()
                ],
              ),
              const Gap(8),
              BlocBuilder<HoaxNewsBloc, HoaxNewsState>(
                builder: (context, state) {
                  if (state is HoaxNewsSuccess) {
                    final HoaxNewsModel model = state.data;
                    final firstHoax = model.articles?.first;
                    return CardTopHoax(firstHoax: firstHoax);
                  }
                  return Shimmer.fromColors(
                      baseColor: Colors.grey.shade300,
                      highlightColor: Colors.grey.shade100,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: double.infinity,
                            height: 200,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          const Gap(8),
                          Container(
                            width: 150,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                          const Gap(8),
                          Container(
                            width: double.infinity,
                            height: 20,
                            decoration: BoxDecoration(
                                color: Colors.grey.shade100,
                                borderRadius: BorderRadius.circular(8)),
                          ),
                        ],
                      ));
                },
              ),
              const Gap(16),
              const Divider(),
              const Gap(12),
              const NunitoText(
                text: "Berita Hoax Lainnya",
                fontSize: 24,
                color: text,
                fontWeight: FontWeight.bold,
              ),
              const Gap(8),
              BlocBuilder<HoaxNewsBloc, HoaxNewsState>(
                builder: (context, state) {
                  if (state is HoaxNewsSuccess) {
                    final List<Articles>? data =
                        state.data.articles?.skip(1).toList();
                    return Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: List.generate(
                          data?.length ?? 0,
                          (index) => CardHoax(data: data?[index]),
                        ));
                  }
                  return Shimmer.fromColors(
                    baseColor: Colors.grey.shade300,
                    highlightColor: Colors.grey.shade100,
                    child: Wrap(
                        spacing: 16,
                        runSpacing: 16,
                        children: List.generate(
                          10,
                          (index) => Column(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                width: (MediaQuery.of(context).size.width / 2) -
                                    28,
                                height:
                                    (MediaQuery.of(context).size.width / 2) -
                                        28,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                              const Gap(8),
                              Container(
                                width: 80,
                                height: 20,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade100,
                                    borderRadius: BorderRadius.circular(8)),
                              ),
                            ],
                          ),
                        )),
                  );
                },
              ),
              const Gap(90),
              BlocListener<HoaxNewsBloc, HoaxNewsState>(
                listener: (context, state) {
                  if (state is HoaxNewsFailed) {
                    ToastHelper.showError(
                        message: state.exception.messageError);
                    if (state.exception is UnauthorizedException) {
                      context.goNamed(LoginPage.routeName);
                    }
                  }
                },
                child: Container(),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void updateKeepAlive() {
    // TODO: implement updateKeepAlive
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => throw UnimplementedError();
}
