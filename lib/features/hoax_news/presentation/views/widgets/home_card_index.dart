import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:hofe/features/hoax_news/presentation/bloc/hoax_news_bloc.dart';

import '../../../../../data/constant.dart';
import '../../../../../shared-widgets/nunito_text.dart';
import '../../../data/model/hoax_news_model.dart';

class CardHoax extends StatelessWidget {
  const CardHoax({
    super.key,
    required this.data,
  });

  final Articles? data;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        context
            .read<HoaxNewsBloc>()
            .add(OpenWebViewHoax(url: data?.url ?? '-'));
      },
      child: SizedBox(
        width: (MediaQuery.of(context).size.width / 2) - 28,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              width: (MediaQuery.of(context).size.width / 2) - 28,
              height: (MediaQuery.of(context).size.width / 2) - 28,
              decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(8),
                  image: DecorationImage(
                      fit: BoxFit.cover,
                      image: NetworkImage(data?.thumbnail ?? ''))),
            ),
            const Gap(8),
            NunitoText(
              text: data?.title ?? '-',
              fontSize: 14,
              color: text,
              maxLines: 2,
            )
          ],
        ),
      ),
    );
  }
}
