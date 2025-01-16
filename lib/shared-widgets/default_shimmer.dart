import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class DefaultShimmer extends StatelessWidget {
  const DefaultShimmer(
      {super.key,
      required this.width,
      required this.height,
      this.borderRadius});
  final double width;
  final double height;
  final double? borderRadius;
  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.grey.shade100,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
              color: Colors.grey.shade100,
              borderRadius: BorderRadius.circular(borderRadius ?? 0)),
        ));
  }
}
