import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hofe/features/hoax_news/presentation/bloc/hoax_news_bloc.dart';

import '../../../../../shared-widgets/nunito_text.dart';
import '../../../data/model/hoax_news_model.dart';

class CardTopHoax extends StatelessWidget {
  const CardTopHoax({
    super.key,
    required this.firstHoax,
  });

  final Articles? firstHoax;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<HoaxNewsBloc>()
            .add(OpenWebViewHoax(url: firstHoax?.url ?? '-'));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            height: 200,
            decoration: BoxDecoration(
                color: Colors.grey.shade100,
                borderRadius: BorderRadius.circular(8),
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(firstHoax?.thumbnail ?? ''))),
          ),
          const Gap(8),
          NunitoText(
            text: firstHoax?.title ?? '-',
            fontSize: 20,
            maxLines: 2,
            fontWeight: FontWeight.bold,
          )
        ],
      ),
    );
  }
}
