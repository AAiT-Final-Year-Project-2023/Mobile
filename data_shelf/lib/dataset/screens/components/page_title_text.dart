import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class PageTitleText extends StatelessWidget {
  final String text;
  final double verticalPadding;
  const PageTitleText({
    super.key,
    required this.text,
    this.verticalPadding = 16.0,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: verticalPadding),
      child: Text(
        text,
        style: titleStyleMidium,
      ),
    );
  }
}
