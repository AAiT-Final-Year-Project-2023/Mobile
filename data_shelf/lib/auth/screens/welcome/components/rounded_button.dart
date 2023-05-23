import 'package:data_shelf/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final Size size;
  final double widthRatio;
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = primaryColor,
      this.textColor = Colors.white,
      this.widthRatio = 0.8,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * widthRatio,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          child: Text(text),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            foregroundColor: textColor,
            backgroundColor: color,
            disabledBackgroundColor: Colors.grey,
          ),
          onPressed: press,
        ),
      ),
    );
  }
}
