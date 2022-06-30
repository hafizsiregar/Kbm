import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomShimmer extends StatelessWidget {

  final double width;
  final double height;
  final BorderRadius borderRadius;
  final EdgeInsets padding;

  const CustomShimmer.first({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.padding,
  }) : super(key: key);

  const CustomShimmer.second({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.padding,
  }) : super(key: key);

  const CustomShimmer.third({
    Key? key,
    required this.width,
    required this.height,
    required this.borderRadius,
    required this.padding,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: padding,
      child: Shimmer.fromColors(
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            borderRadius: borderRadius,
            color: Colors.grey[300]!,
          ),
        ),
      ),
    );
  }
}