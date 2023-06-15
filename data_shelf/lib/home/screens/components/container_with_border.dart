import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class containerWithBorder extends StatelessWidget {
  double width;
  double height;
  Widget child;
  Color color;
  containerWithBorder({
    this.width = 100.0,
    this.height = 100.0,
    this.color = Colors.white,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        border: Border.all(
          color: primaryColor,
          width: 2.0,
        ),
        borderRadius: BorderRadius.circular(10.0),
      ),
      child: child,
    );
  }
}
