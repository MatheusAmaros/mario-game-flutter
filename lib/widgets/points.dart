import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Points extends StatelessWidget {
  const Points({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Column(
          children: [
            Text(
              "Mario",
              style: GoogleFonts.getFont('Press Start 2P')
                  .copyWith(fontSize: 20, color: Colors.white),
            ),
            Text(
              "0",
              style: GoogleFonts.getFont('Press Start 2P')
                  .copyWith(fontSize: 20, color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Text(
              "World",
              style: GoogleFonts.getFont('Press Start 2P')
                  .copyWith(fontSize: 20, color: Colors.white),
            ),
            Text(
              "1-1",
              style: GoogleFonts.getFont('Press Start 2P')
                  .copyWith(fontSize: 20, color: Colors.white),
            )
          ],
        ),
        Column(
          children: [
            Text(
              "Time",
              style: GoogleFonts.getFont('Press Start 2P')
                  .copyWith(fontSize: 20, color: Colors.white),
            ),
            Text(
              "9999",
              style: GoogleFonts.getFont('Press Start 2P')
                  .copyWith(fontSize: 20, color: Colors.white),
            )
          ],
        )
      ],
    );
  }
}
