import 'package:flutter/material.dart';

class Backgroundimage extends StatelessWidget {
  const Backgroundimage({
    Key key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ShaderMask(
      shaderCallback: (bounds) => LinearGradient(
          colors: [Colors.black,Colors.black12],
          begin: Alignment.bottomCenter).createShader(bounds),
      blendMode: BlendMode.darken,
      child: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/Background-Image.png"),
              fit: BoxFit.cover,
              colorFilter: ColorFilter.mode(Colors.black45, BlendMode.darken),
            )
        ),
      ),
    );
  }
}


