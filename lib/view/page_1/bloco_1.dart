import 'package:blog_grupo/controller/controllerPages.dart';
import 'package:blog_grupo/model/model.dart';
import 'package:blog_grupo/view/page_item/page.dart';
import 'package:blog_grupo/view/widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

Backend instance = Backend.instance;
Items instance1 = Items.instance;
Connect instance2 = Connect();

//  modificando
class Bloco_1 extends StatefulWidget {
  Bloco_1(this.data, {super.key});
  var data;
  @override
  State<Bloco_1> createState() => _Bloco_1State();
}

class _Bloco_1State extends State<Bloco_1> {
  @override
  Widget build(BuildContext context) {
    //=======================================

    double largura = MediaQuery.of(context).size.width;
    return Container(
      width: largura,
      child: Column(
        children: [
          topbar(largura),
          RowTextTitulo_1(largura),
          carrosel(largura),
          RowTextTitulo_2(largura),
          largura > 670 ? RowsCards(largura) : ColunmCards(largura),
        ],
      ),
    );
  }
}

//========================================================<<<<<<<<<<<<<<<<<
Widget topbar(largura) {
  int responsive = 120;
  if (largura < 1100) responsive = 90;
  if (largura < 750) responsive = 80;
  if (largura < 590) responsive = 70;
  int responsive_padding = 70;
  if (largura < 590) responsive_padding = 20;
  int responsive_flex = 4;
  if (largura < 700) responsive_flex += 20;

  return Container(
    height: responsive * 1,
    width: largura,
    padding: EdgeInsets.only(left: responsive_padding * 1),
    color: Color(0xffF67968),
    child: Row(
      children: [
        CircularImage(responsive, fn: () {}, image: 'images/icons/logo.png'),
        Spacer(flex: 1),
        textColunm(responsive),
        Spacer(flex: 100),
        CircularImage(responsive - 10,
            image: 'images/icons/BTN_menu.png', fn: () {}, efeito: true),
        Spacer(flex: responsive_flex),
      ],
    ),
  );
}

//========================================================<<<<<<<<<<<<<<<<<
Widget textColunm(responsive) {
  return Align(
    alignment: Alignment.centerLeft,
    child: Container(
      //color: Colors.blue,
      width: 250,
      height: responsive,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //=======================================
          Align(
              alignment: Alignment.centerLeft,
              child: textPerson(
                  text: 'CozinhaArte',
                  fontStyle: FontStyle.italic,
                  fontSize: 35,
                  color: Colors.white)),
          //=======================================
          Align(
              alignment: Alignment.centerLeft,
              child: textPerson(
                  text: 'Deixe a comida falar por si mesma',
                  fontStyle: FontStyle.italic,
                  fontSize: 15,
                  color: Colors.white)),
          //=======================================
        ],
      ),
    ),
  );
}

//========================================================<<<<<<<<<<<<<<<<<
Widget RowTextTitulo_1(largura) {
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
    height: responsive * 1,
    width: largura,
    child: Stack(
      children: [
        Align(
            alignment: Alignment(0, 0),
            child: textPerson(
                text: 'Descubra novos sabores', fontSize: fontsize_1)),
        largura > 1050
            ? Align(
                alignment: Alignment(0.7, 0),
                child: textPerson(
                    text:
                        'Receitas simpes,\nsaborosas e inspiradoras\npara todas as ocasiões',
                    fontSize: fontsize_2),
              )
            : Container(),
      ],
    ),
  );
}

//========================================================<<<<<<<<<<<<<<<<<
Widget RowTextTitulo_2(largura) {
  int responsive = 120;
  if (largura < 1100) responsive = 90;
  if (largura < 750) responsive = 80;

  int fontsize_1 = 40;
  if (largura < 1250) fontsize_1 -= 5;
  if (largura < 870) fontsize_1 -= 5;
  if (largura < 700) fontsize_1 -= 5;
  if (largura < 600) fontsize_1 -= 2;
  if (largura < 500) fontsize_1 -= 2;

  return Container(
    height: responsive * 1,
    width: largura,
    child: Stack(
      children: [
        Align(
            alignment: Alignment(0, 0),
            child: textPerson(
                text: 'Visite um dos nossos topicos deliciosos',
                fontSize: fontsize_1)),
      ],
    ),
  );
}

//========================================================<<<<<<<<<<<<<<<<<
Widget carrosel(largura) {
  int altura_responsive = 400;

  //  altura
  if (largura < 890) altura_responsive -= 50;
  if (largura < 1000) altura_responsive -= 50;
  if (largura < 790) altura_responsive -= 50;
  if (largura < 675) altura_responsive -= 1;
  if (largura < 490) altura_responsive -= 20;

  return Container(
    height: altura_responsive * 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        //
        largura > 850
            ? CircularImage(90,
                image: 'images/icons/btn_next_left.png', efeito: true, fn: () {
                instance.controllerImage.previousPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.decelerate);
              })
            : Container(),
        //
        TrocaImagem(),
        //
        largura > 850
            ? CircularImage(90,
                image: 'images/icons/btn_next_right.png', efeito: true, fn: () {
                instance.controllerImage.nextPage(
                    duration: Duration(milliseconds: 300),
                    curve: Curves.decelerate);
              })
            : Container()
        //
      ],
    ),
  );
}

class TrocaImagem extends StatefulWidget {
  TrocaImagem({super.key});
  @override
  State<TrocaImagem> createState() => _TrocaImagemState();
}

class _TrocaImagemState extends State<TrocaImagem> {
  _TrocaImagemState();
  int i = 0;
  @override
  Widget build(BuildContext context) {
    //=====================================================
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
      child: PageView.builder(
          controller: instance.controllerImage,
          itemCount: instance.pratosPrincipais.length,
          itemBuilder: (_, currentIndex) {
            return image_mecanismo(
                largura_image, instance.pratosPrincipais, currentIndex);
          }),
    );
  }
}

//===================================================
// mecanismo visual
class image_mecanismo extends StatefulWidget {
  image_mecanismo(this.largura_image, this.listaImagem, this.currentIndex,
      {super.key});
  var largura_image;
  var listaImagem;
  var currentIndex;
  @override
  State<image_mecanismo> createState() => _image_mecanismoState();
}

class _image_mecanismoState extends State<image_mecanismo> {
  @override
  var enable = false;
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        instance1.data_now = instance.pratosPrincipais[widget.currentIndex];
        Get.to(() => page_item());
      },
      onHover: (value) => setState(() {
        enable = value;
      }),
      child: Container(
          width: widget.largura_image * 1,
          margin: enable
              ? EdgeInsets.symmetric(horizontal: 40 + 10, vertical: 10)
              : EdgeInsets.symmetric(horizontal: 40, vertical: 0),
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: NetworkImage(
                      widget.listaImagem[widget.currentIndex]['image']),
                  fit: BoxFit.fitHeight),
              borderRadius: BorderRadius.circular(50))),
    );
  }
}

//========================================================<<<<<<<<<<<<<<<<<
Widget RowsCards(largura) {
  int altura_container = 300;
  if (largura < 1170) altura_container -= 30;
  if (largura < 890) altura_container -= 30;
  return Container(
    height: altura_container * 1,
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cards_responsive(altura_container,
            image: instance.cardsList[1]['image'],
            text: instance.cardsList[1]['titulo'], fn: () {
          instance1.data_now = instance.cardsList[1];
          Get.to(() => page_item());
        }),
        //===================================================
        Linha_divisoria(altura_container),
        //===================================================
        cards_responsive(altura_container,
            image: instance.cardsList[0]['image'],
            text: instance.cardsList[0]['titulo'], fn: () {
          instance1.data_now = instance.cardsList[0];
          Get.to(() => page_item());
        }),
        //===================================================
        Linha_divisoria(altura_container),
        //===================================================
        cards_responsive(altura_container,
            image: instance.cardsList[2]['image'],
            text: instance.cardsList[2]['titulo'], fn: () {
          instance1.data_now = instance.cardsList[2];
          Get.to(() => page_item());
        }),
      ],
    ),
  );
}

//========================================================<<<<<<<<<<<<<<<<<
Widget Linha_divisoria(altura_divisoria) {
  return Container(
      margin: EdgeInsets.symmetric(horizontal: 30),
      height: altura_divisoria * 0.8,
      width: 2,
      color: Color(0xffEC998E));
}

class cards_responsive extends StatefulWidget {
  cards_responsive(this.altura_card,
      {super.key, this.text, this.image, this.fn});
  String? text;
  String? image;

  int? altura_card;
  Function? fn;

  @override
  State<cards_responsive> createState() => _cards_responsiveState(
      image: image, text: text, altura_card: altura_card, fn: fn);
}

class _cards_responsiveState extends State<cards_responsive> {
  _cards_responsiveState({this.text, this.image, this.altura_card, this.fn});
  @override
  String? text;
  String? image;
  int? altura_card;
  Function? fn;
  var enable = false;
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    //  fontsize
    int fontsize_1 = 25;
    if (largura < 1020) fontsize_1 -= 3;
    if (largura < 890) fontsize_1 -= 3;
    //  largura do card individual
    int largura_card = 300;
    if (largura < 1170) largura_card -= 30;
    if (largura < 1020) largura_card -= 30;
    if (largura < 890) largura_card -= 30;
    if (largura < 770) largura_card -= 30;
    return InkWell(
      onHover: (value) => setState(() {
        enable = !value;
      }),
      onTap: () => fn!(),
      child: Container(
        // color: Colors.red,
        margin: EdgeInsets.symmetric(
            horizontal: enable ? 0 : 10, vertical: enable ? 0 : 10),
        child: Column(
          children: [
            SizedBox(height: 10),
            Container(
                height: altura_card! * (largura > 900 ? 0.7 : .6),
                width: largura_card * (largura > 1000 ? 1 : .9),
                decoration: BoxDecoration(
                    image: DecorationImage(image: NetworkImage(image!)),
                    borderRadius: BorderRadius.circular(50))),
            SizedBox(height: largura > 1020 ? 10 : 0),
            Container(
                child: textPerson(
                    text: text, color: Colors.black, fontSize: fontsize_1))
          ],
        ),
      ),
    );
  }
}

//========================================================<<<<<<<<<<<<<<<<<

//========================================================<<<<<<<<<<<<<<<<<

Widget ColunmCards(largura) {
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        cards_responsive_2(largura,
            image: instance.cardsList[2]['image'],
            text: instance.cardsList[2]['titulo'], fn: () {
          instance1.data_now = instance.cardsList[2];
          Get.to(() => page_item());
        }),
        cards_responsive_2(largura,
            image: instance.cardsList[1]['image'],
            text: instance.cardsList[1]['titulo'], fn: () {
          instance1.data_now = instance.cardsList[1];
          Get.to(() => page_item());
        }),
        cards_responsive_2(largura,
            image: instance.cardsList[0]['image'],
            text: instance.cardsList[0]['titulo'], fn: () {
          instance1.data_now = instance.cardsList[0];
          Get.to(() => page_item());
        }),
      ],
    ),
  );
}

Widget cards_responsive_2(largura,
    {text = 'Sobremesas', image = 'images/img_categoria1.png', fn}) {
  //  fontsize
  int fontsize_1 = 35;
  if (largura < 580) fontsize_1 -= 5;
  if (largura < 510) fontsize_1 -= 5;
  if (largura < 450) fontsize_1 -= 5;
  //  responsive_1
  int responsive_Image = 200;
  if (largura < 580) responsive_Image -= 50;
  if (largura < 490) responsive_Image -= 0;
  int responsive_CircularImage = 75;
  if (largura < 580) responsive_CircularImage -= 5;
  if (largura < 490) responsive_CircularImage -= 5;
  int responsive_MARGIN_ = 10;
  int responsive_SizedBox_ = 50;
  if (largura < 490) responsive_SizedBox_ -= 30;
  int responsive_altura_ = 200;
  if (largura < 580) responsive_altura_ -= 30;
  if (largura < 490) responsive_altura_ -= 10;

  return InkWell(
    onTap: () => fn(),
    child: Container(
      width: largura - 40,
      height: responsive_altura_ * 1,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          boxShadow: Efeito_sombra(),
          color: Color(0xffF7F7F7),
          borderRadius: BorderRadius.circular(50)),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          //  image   <<
          Container(
            width: responsive_Image * 1,
            margin: EdgeInsets.only(
                left: responsive_MARGIN_ * 1, right: responsive_MARGIN_ * 1),
            decoration: BoxDecoration(
                image: DecorationImage(image: NetworkImage(image))),
          ),
          //  text   <<
          Flexible(
              child: Container(
                  child: Align(
            alignment: Alignment(-0.8, -0.5),
            child: textPerson(
                text: text, color: Colors.black, fontSize: fontsize_1),
          ))),
          //  Image_BTN   <<
          largura > 450
              ? CircularImage(responsive_CircularImage,
                  efeito: true,
                  image: 'images/icons/btn_next_right.png',
                  fn: () {})
              : Container(),
          //  margin   <<
          SizedBox(
            width: responsive_SizedBox_ * 1,
          ),
        ],
      ),
    ),
  );
}
