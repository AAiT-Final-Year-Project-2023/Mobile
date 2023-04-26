import 'package:flutter/material.dart';

class Background extends StatelessWidget {
  final Widget child;
  const Background({
    Key? key,
    required this.child,
    this.topImage = "assets/images/circular.svg",
    this.bottomImage = "assets/images/diamond.svg",
  }) : super(key: key);

  final String topImage, bottomImage;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; // screen size

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Container(
          height: size.height,
          width: double.infinity,
          child: Stack(
            alignment: Alignment.center,
            children: <Widget>[
              Positioned(
                  top: -100,
                  left: -100,
                  child: Image.asset(
                    topImage,
                    width: 200,
                    opacity: AlwaysStoppedAnimation(.5),
                  )),
              Positioned(
                bottom: -100,
                right: -100,
                child: Image.asset(
                  topImage,
                  width: 200,
                  opacity: AlwaysStoppedAnimation(.4),
                ),
              ),
              SafeArea(child: child)
            ],
          ),
        ));
  }
}
