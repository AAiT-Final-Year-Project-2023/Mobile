import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class SubTitleText extends StatelessWidget {
  final String text;
  const SubTitleText({
    super.key,
    required this.text,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        text,
        style: titleStyleSmall,
      ),
    );
  }
}
