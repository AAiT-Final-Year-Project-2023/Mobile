import 'package:data_shelf/utils/constants.dart';
import 'package:flutter/material.dart';

class OrDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
      width: size.width * 0.8,
      child: Row(children: [
        buildDivider(),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "OR",
            style: TextStyle(color: primaryColor, fontWeight: FontWeight.w600),
          ),
        ),
        buildDivider()
      ]),
    );
  }

  Expanded buildDivider() {
    return Expanded(
        child: Divider(
      color: Colors.blue,
      height: 1.5,
    ));
  }
}
