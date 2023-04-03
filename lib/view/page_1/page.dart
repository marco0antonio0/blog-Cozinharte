import 'package:blog_grupo/controller/controllerPages.dart';
import 'package:blog_grupo/view/page_1/bloco_1.dart';
import 'package:blog_grupo/view/page_1/bloco_2.dart';
import 'package:flutter/material.dart';

import '../../model/model.dart';

Connect instance2 = Connect();
Backend instance1 = Backend.instance;

class PaginaInicio extends StatefulWidget {
  const PaginaInicio({super.key});

  @override
  State<PaginaInicio> createState() => _PaginaInicioState();
}

class _PaginaInicioState extends State<PaginaInicio> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
          child: FutureBuilder(
              future: instance2.fetchUserData(),
              builder: (context, AsyncSnapshot snapshot) {
                var data = snapshot.data;
                if (snapshot.connectionState == ConnectionState.done) {
                  instance1.data = snapshot.data;
                  instance.filter();
                  print(instance.pratosPrincipais);
                  return Column(children: [
                    Bloco_1(data),
                    bloco_2(),
                  ]);
                }

                return Container();
              })),
    );
  }
}
