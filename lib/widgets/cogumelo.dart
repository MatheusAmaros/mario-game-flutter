import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';

class Cogumelo extends StatelessWidget {
  const Cogumelo({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: 30,
      child: Image.asset("assets/cogumelo.png"),
    );
  }
}
