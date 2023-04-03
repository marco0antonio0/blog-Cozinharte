import 'package:blog_grupo/controller/controllerPages.dart';
import 'package:blog_grupo/view/widget.dart';
import 'package:flutter/material.dart';

Items instance1 = Items.instance;
Backend instance = Backend.instance;

//  modificando
class Bloco_1 extends StatefulWidget {
  const Bloco_1({super.key});

  @override
  State<Bloco_1> createState() => _Bloco_1State();
}

class _Bloco_1State extends State<Bloco_1> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return Container(
      width: largura,
      child: Column(
        children: [
          topbar(largura),
          RowTextTitulo_1(largura),
          layoutImageReceita(largura),
        ],
      ),
    );
  }
}

//========================================================<<<<<<<<<<<<<<<<<
Widget RowTextTitulo_1(largura) {
  double responsive_text = 1;
  if (largura < 1450) responsive_text -= 2;
  if (largura < 1200) responsive_text -= 2;
//========================================
  int responsive = 120;
  if (largura < 1100) responsive = 90;
  if (largura < 750) responsive = 80;

  int fontsize_1 = 40;
  if (largura < 1250) fontsize_1 -= 5;
  if (largura < 870) fontsize_1 -= 5;

  int fontsize_2 = 20;
  if (largura < 1250) fontsize_2 -= 5;
  if (largura < 870) fontsize_2 -= 5;
  return Container(
    // color: Colors.red,
    height: responsive * 0.7,
    width: largura,
    child: Align(
        alignment: Alignment(0, .8),
        child: textPerson(
            text: instance1.data_now['titulo'],
            fontSize: fontsize_1 + responsive_text)),
  );
}

//========================================================<<<<<<<<<<<<<<<<<
Widget layoutImageReceita(double largura) {
  double altura_responsive = 400;
  //=====================================================
  double largura_contaeiner = 1400;
  //=====================================================
  //  largura
  if (largura < 1600) largura_contaeiner -= 300;
  if (largura < 1300) largura_contaeiner -= 300;
  if (largura < 1000) largura_contaeiner -= 100;
  if (largura < 890) largura_contaeiner -= 60;
  if (largura < 790) largura_contaeiner -= 20;
  if (largura < 675) largura_contaeiner -= 50;
  if (largura < 560) largura_contaeiner -= 40;
  if (largura < 520) largura_contaeiner -= 40;
  if (largura < 470) largura_contaeiner -= 40;
  if (largura < 420) largura_contaeiner -= 20;
  if (largura < 400) largura_contaeiner -= 0;
  //=====================================================
  //  altura
  if (largura < 890) altura_responsive -= 50;
  if (largura < 1000) altura_responsive -= 50;
  if (largura < 790) altura_responsive -= 50;
  if (largura < 675) altura_responsive -= 1;
  if (largura < 490) altura_responsive -= 20;

  return Container(
      height: altura_responsive * 1.45,
      child: Stack(
        children: [
          //========================================
          //  dados da receita abaixo da imagem
          blocoAbaixoDaImagem(altura_responsive, largura_contaeiner),
          //========================================
          //   imagem da receita
          Align(
              alignment: Alignment(0, -1),
              child: Container(
                  height: altura_responsive * 1, child: ImageReceita())),
        ],
      ));
}

class ImageReceita extends StatefulWidget {
  ImageReceita({super.key});

  @override
  State<ImageReceita> createState() => _ImageReceitaState();
}

class _ImageReceitaState extends State<ImageReceita> {
  _ImageReceitaState();
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    //=====================================================
    //=====================================================
    int largura_image = 1400;
    //=====================================================
    //  largura
    if (largura < 1600) largura_image -= 300;
    if (largura < 1300) largura_image -= 300;
    if (largura < 1000) largura_image -= 100;
    if (largura < 890) largura_image -= 60;
    if (largura < 790) largura_image -= 20;
    if (largura < 675) largura_image -= 50;
    if (largura < 560) largura_image -= 40;
    if (largura < 520) largura_image -= 40;
    if (largura < 470) largura_image -= 40;
    if (largura < 420) largura_image -= 20;
    if (largura < 400) largura_image -= 0;
    //=====================================================
    return Container(
        width: MediaQuery.of(context).size.width > 490
            ? largura_image - 20
            : largura_image - 35,
        child: Container(
            width: largura_image * 1,
            margin: EdgeInsets.symmetric(horizontal: 40),
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(instance1.data_now['image']),
                    fit: BoxFit.fitHeight),
                borderRadius: BorderRadius.circular(50))));
  }
}

class blocoAbaixoDaImagem extends StatelessWidget {
  blocoAbaixoDaImagem(this.altura_responsive, this.largura_contaeiner,
      {super.key});
  double? altura_responsive;
  double? largura_contaeiner;
  double responsive_text = 1;
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    if (largura < 1450) responsive_text -= 5;
    if (largura < 1200) responsive_text -= 5;
    print(largura);
    return Align(
        alignment: Alignment(0, 1),
        child: Container(
          height: altura_responsive! * .65,
          width: largura_contaeiner!,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(20),
              color: Color(0xffECECEC)),
          child: Row(
            children: [
              //===================================================
              // bloco 1   <<<<<<<<<
              item_receita(
                  //======================================
                  child1: Container(
                      decoration: BoxDecoration(
                          image: DecorationImage(
                              image: AssetImage(
                                  'images/icons/estrelas avaiação 1.png')))),
                  //======================================
                  text: instance1.data_now['avaliacao'],
                  fontSize: 24 + responsive_text,
                  color: Colors.black),
              //===================================================
              item_linha(altura_responsive),
              //===================================================
              // bloco 2   <<<<<<<<<
              item_receita(
                  //======================================
                  child1: Container(
                      child: Center(
                          child: textPerson(
                              text: 'TEMPO DE PREPARO',
                              fontSize: 30 + (responsive_text * 1.2)))),
                  //======================================
                  text: instance1.data_now['tempo_de_preparo']),

              //===================================================
              item_linha(altura_responsive),
              //===================================================
              // bloco 3   <<<<<<<<<
              item_receita(
                  //======================================
                  child1: Container(
                      child: Center(
                          child: textPerson(
                              text: 'RENDIMENTO',
                              fontSize: 30 + (responsive_text * 1.2)))),
                  //======================================
                  text: instance1.data_now['rendimento']),
            ],
          ),
        ));
  }
}

Widget item_receita(
    {child1, text = '', fontSize = 20, color = const Color(0xffEC998E)}) {
  return Expanded(
      flex: 100,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3),
        child: Column(
          children: [
            Spacer(flex: 150),
            Expanded(flex: 100, child: Container(child: child1)),
            Spacer(flex: 10),
            Expanded(
                flex: 100,
                child: Container(
                    child: Align(
                  alignment: Alignment(0, -.5),
                  child:
                      textPerson(text: text, color: color, fontSize: fontSize),
                ))),
            Spacer(flex: 20),
          ],
        ),
        //color: Colors.red
      ));
}

Widget item_linha(altura_responsive) {
  return Container(
      width: 3, height: altura_responsive! * .65, color: Color(0xffF67968));
}
