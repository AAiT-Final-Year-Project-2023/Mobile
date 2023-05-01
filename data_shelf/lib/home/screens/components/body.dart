import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
        child: Column(
      children: [
        Row(
          children: [Container(color: Colors.blue)],
        )
      ],
    ));
  }
}
