import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class containerWithBorder extends StatelessWidget {
  double width;
  double height;
  Widget child;
  containerWithBorder({
    this.width = 100.0,
    this.height = 100.0,
    required this.child,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
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
