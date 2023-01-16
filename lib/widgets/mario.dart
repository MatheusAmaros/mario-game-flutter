import 'dart:math';

import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class MyMario extends StatelessWidget {
  final direction;
  final walking;
  final size;
  const MyMario(
      {@required this.direction,
      @required this.walking,
      @required this.size,
      super.key});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        width: size,
        height: size,
        child: walking
            ? Image.asset("assets/correndo.png")
            : Image.asset("assets/parado.png"),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(3.14),
        child: Container(
          width: size,
          height: size,
          child: walking
              ? Image.asset("assets/correndo.png")
              : Image.asset("assets/parado.png"),
        ),
      );
    }
  }
}
