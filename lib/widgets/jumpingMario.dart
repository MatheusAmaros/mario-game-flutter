import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class JumpingMario extends StatelessWidget {
  final direction;
  final size;
  const JumpingMario(
      {@required this.direction, @required this.size, super.key});

  @override
  Widget build(BuildContext context) {
    if (direction == "right") {
      return Container(
        height: size,
        width: size,
        child: Image.asset('assets/pulando.png'),
      );
    } else {
      return Transform(
        transform: Matrix4.rotationY(10),
        child: Container(
          height: size,
          width: size,
          child: Image.asset('assets/pulando.png'),
        ),
      );
    }
  }
}
