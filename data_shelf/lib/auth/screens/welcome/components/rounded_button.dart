import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final String text;
  final VoidCallback press;
  final Color color, textColor;
  final bool border;
  final Size size;
  final double widthRatio;
  const RoundedButton(
      {Key? key,
      required this.text,
      required this.press,
      this.color = primaryColor,
      this.textColor = Colors.white,
      this.widthRatio = 0.8,
      this.border = false,
      required this.size})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      width: size.width * widthRatio,
      decoration: border
          ? BoxDecoration(
              border: Border.all(color: primaryColor),
              borderRadius: BorderRadius.circular(29),
            )
          : null,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(29),
        child: TextButton(
          child: Text(text),
          style: TextButton.styleFrom(
            padding: EdgeInsets.symmetric(vertical: 15, horizontal: 40),
            foregroundColor: border ? primaryColor : textColor,
            backgroundColor: border ? Colors.white : color,
            disabledBackgroundColor: Colors.grey,
          ),
          onPressed: press,
        ),
      ),
    );
  }
}
