import 'package:blog_grupo/view/bloco_1.dart';
import 'package:blog_grupo/view/bloco_2.dart';
import 'package:flutter/material.dart';

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(children: [
        bloco_1(),
        bloco_2(),
      ]),
    );
  }
}
