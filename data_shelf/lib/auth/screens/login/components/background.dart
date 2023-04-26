import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      width: double.infinity,
      child: Stack(
        alignment: Alignment.center,
        children: <Widget>[
          Positioned(
              top: -100,
              left: -100,
              child: Image.asset(
                "assets/images/circular.svg",
                width: 200,
                opacity: AlwaysStoppedAnimation(.2),
              )),
          Positioned(
            bottom: -100,
            right: -100,
            child: Image.asset(
              "assets/images/circular.svg",
              width: 200,
              opacity: AlwaysStoppedAnimation(.4),
            ),
          ),
          SafeArea(child: child)
        ],
      ),
    );
  }
}
