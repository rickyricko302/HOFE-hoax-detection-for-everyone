import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hofe/features/detect_hoax/presentations/views/detect_hoax_page.dart';

import '../../../../../data/constant.dart';

class HomeFab extends StatelessWidget {
  const HomeFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        context.pushNamed(DetectHoaxPage.routeName);
      },
      elevation: 0,
      backgroundColor: orange,
      tooltip: 'Hoax Detection',
      child: const Icon(Icons.document_scanner),
    );
  }
}
