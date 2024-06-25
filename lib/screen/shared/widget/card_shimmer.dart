import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CardShimmer extends StatelessWidget {
  const CardShimmer({Key? key, this.height = 200, this.color})
      : super(key: key);
  final double height;
  final Color? color;
  @override
  Widget build(BuildContext context) {
    return Card(
      margin: EdgeInsets.zero,
      elevation: 0,
      shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(10))),
      child: Column(
        children: [
          Shimmer.fromColors(
            baseColor: color ?? Colors.grey[300]!,
            highlightColor:
                color != null ? color!.withOpacity(0.2) : Colors.grey[200]!,
            child: Container(
              height: height,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color:
                    color != null ? color!.withOpacity(0.2) : Colors.grey[200],
              ),
              width: MediaQuery.of(context).size.width,
            ),
          ),
        ],
      ),
    );
  }
}
