import 'dart:js';

import 'package:flutter/material.dart';

class bloco_2 extends StatefulWidget {
  const bloco_2({super.key});

  @override
  State<bloco_2> createState() => _bloco_2State();
}

class _bloco_2State extends State<bloco_2> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double responsive = largura > 1100
        ? 120
        : largura > 750
            ? 90
            : 80;
    return Column(
      children: [
        bloco_0(),
        Container(
          height: 30,
        ),
        bloco_1(responsive)
      ],
    );
  }
}

Widget bloco_0() {
  return Container(
    decoration: BoxDecoration(
        color: Color(0xffF8B182), borderRadius: BorderRadius.circular(50)),
    margin: EdgeInsets.symmetric(horizontal: 100),
    height: 500,
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.only(left: 70),
  );
}

Widget bloco_1(responsive) {
  return Container(
    height: responsive,
    alignment: Alignment.bottomCenter,
    padding: EdgeInsets.only(left: 70),
    color: Color(0xffF67968),
  );
}
