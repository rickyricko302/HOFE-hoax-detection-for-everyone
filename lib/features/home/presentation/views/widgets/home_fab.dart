import 'package:flutter/material.dart';

import '../../../../../data/constant.dart';

class HomeFab extends StatelessWidget {
  const HomeFab({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {},
      elevation: 0,
      backgroundColor: orange,
      tooltip: 'Hoax Detection',
      child: const Icon(Icons.document_scanner),
    );
  }
}
