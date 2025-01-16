import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:shimmer/shimmer.dart';

import '../../../../../data/constant.dart';
import '../../../../../shared-widgets/nunito_text.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () => Future.delayed(const Duration(seconds: 3)),
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
                  CircleAvatar(
                    radius: 24,
                  )
                ],
              ),
              const Gap(8),
              Shimmer.fromColors(
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
                  )),
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
              Shimmer.fromColors(
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
                            width: (MediaQuery.of(context).size.width / 2) - 28,
                            height:
                                (MediaQuery.of(context).size.width / 2) - 28,
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
              ),
              const Gap(12),
            ],
          ),
        ),
      ),
    );
  }
}
