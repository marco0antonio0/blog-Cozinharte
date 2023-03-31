import 'package:blog_grupo/view/page_item/bloco_1.dart';
import 'package:blog_grupo/view/page_item/bloco_1_2.dart';
import 'package:flutter/material.dart';

class page_item extends StatefulWidget {
  const page_item({super.key});

  @override
  State<page_item> createState() => _page_itemState();
}

class _page_itemState extends State<page_item> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(children: [
          Bloco_1(),
          Bloco_1_2(),
        ]),
      ),
    );
  }
}
