import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mario_flutter/widgets/cogumelo.dart';
import 'package:mario_flutter/widgets/jumpingMario.dart';
import 'package:mario_flutter/widgets/mario.dart';
import 'package:mario_flutter/widgets/points.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  static double marioSize = 50;
  static double marioX = 0;
  static double marioY = 1;
  static double coguX = 0.9;
  static double coguY = 1;
  String direction = "right";
  double time = 0;
  double height = 0;
  double initialHeight = marioY;
  bool walking = false;
  bool jumping = false;
  bool stop = false;

  void verifyCogu() {
    if ((marioX - coguX).abs() < 0.05 && (marioY - coguY).abs() < 0.05) {
      setState(() {
        marioSize = 70;
      });
    }
  }

  void preJump() {
    time = 0;
    initialHeight = marioY;
  }

  void jump() {
    if (jumping == false) {
      jumping = true;
      preJump();
      Timer.periodic(Duration(milliseconds: 50), (timer) {
        time += 0.05;
        height = -4.9 * time * time + 5 * time;

        if (initialHeight - height > 1) {
          jumping = false;
          timer.cancel();
          setState(() {
            marioY = 1;
          });
        } else {
          setState(() {
            marioY = initialHeight - height;
          });
        }
      });
    }
  }

  void moveLeft() {
    verifyCogu();
    direction = "left";
    walking = !walking;
    setState(() {
      marioX -= 0.03;
    });
  }

  void runLeft() {
    direction = "left";

    Timer.periodic(Duration(milliseconds: 50), (tempo) {
      if (stop == true) {
        tempo.cancel();
      }
      setState(() {
        marioX -= 0.02;
        walking = !walking;
      });
      verifyCogu();
    });
    stop = false;
  }

  void moveRight() {
    verifyCogu();
    direction = "right";
    walking = !walking;
    setState(() {
      marioX += 0.03;
    });
  }

  void runRight() {
    direction = "right";

    Timer.periodic(Duration(milliseconds: 50), (tempo) {
      if (stop == true) {
        tempo.cancel();
      }
      setState(() {
        marioX += 0.02;
        walking = !walking;
      });
      verifyCogu();
    });
    stop = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        toolbarHeight: 60,
        elevation: 0,
        centerTitle: true,
        title: Points(),
      ),
      body: Column(
        children: [
          Expanded(
              flex: 4,
              child: Stack(
                children: [
                  Container(
                    color: Colors.blue,
                    child: AnimatedContainer(
                        alignment: Alignment(marioX, marioY),
                        duration: Duration(milliseconds: 0),
                        child: jumping
                            ? JumpingMario(
                                direction: direction,
                                size: marioSize,
                              )
                            : MyMario(
                                direction: direction,
                                walking: walking,
                                size: marioSize,
                              )),
                  ),
                  Container(
                    alignment: Alignment(coguX, coguY),
                    child: marioSize > 50 ? null : Cogumelo(),
                  )
                ],
              )),
          Container(
            height: 10,
            color: Colors.green,
          ),
          Expanded(
              flex: 1,
              child: Container(
                color: Colors.brown,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: () => moveLeft(),
                      onLongPress: () => runLeft(),
                      onLongPressEnd: (details) => stop = true,
                      child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: Offset(0, 2))
                              ],
                              color: Color.fromARGB(240, 122, 122, 122)),
                          child: Icon(
                            Icons.arrow_back,
                            color: Colors.white,
                          )),
                    ),
                    GestureDetector(
                      onTap: () => jump(),
                      child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: Offset(0, 2))
                              ],
                              color: Color.fromARGB(240, 122, 122, 122)),
                          child: Icon(
                            Icons.arrow_upward,
                            color: Colors.white,
                          )),
                    ),
                    GestureDetector(
                      onTap: () => moveRight(),
                      onLongPress: () => runRight(),
                      onLongPressEnd: (details) {
                        stop = true;
                      },
                      child: Container(
                          width: 70,
                          height: 70,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              boxShadow: [
                                BoxShadow(
                                    color: Colors.black,
                                    spreadRadius: 1,
                                    blurRadius: 0,
                                    offset: Offset(0, 2))
                              ],
                              color: Color.fromARGB(240, 122, 122, 122)),
                          child: Icon(
                            Icons.arrow_forward_sharp,
                            color: Colors.white,
                          )),
                    )
                  ],
                ),
              ))
        ],
      ),
    );
  }
}
