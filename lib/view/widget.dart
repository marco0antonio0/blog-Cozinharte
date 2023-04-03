import 'package:flutter/material.dart';

//==========================================================================
Widget textPerson(
    {text = '',
    enable = true,
    fontSize = 20,
    fontWeight = null,
    color = const Color(0xffEC998E),
    fontStyle = FontStyle.normal,
    TextAlign = TextAlign.left}) {
  return enable
      ? SelectableText(
          text,
          style: TextStyle(
              fontSize: fontSize * 1,
              fontWeight: fontWeight,
              color: color,
              fontStyle: fontStyle),
          textAlign: TextAlign,
        )
      : SelectableText(
          text,
          style: TextStyle(
              fontSize: fontSize * 1,
              fontWeight: fontWeight,
              color: color,
              fontStyle: fontStyle),
          textAlign: TextAlign,
        );
}

//==========================================================================
Widget CircularImage(responsive,
    {fn, image = 'images/logo.png', largura, efeito = false}) {
  return InkWell(
    onTap: () => fn(),
    child: Container(
        height: responsive - 10,
        width: responsive - 10,
        decoration: BoxDecoration(
            boxShadow: efeito ? Efeito_sombra() : null,
            image: DecorationImage(image: AssetImage(image)),
            shape: BoxShape.circle)),
  );
}

//
List<BoxShadow> Efeito_sombra() {
  return [
    BoxShadow(
      color: Colors.black.withOpacity(0.15),
      spreadRadius: 5,
      blurRadius: 7,
      offset: Offset(0, 3), // changes position of shadow
    ),
  ];
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

class selectorCircular extends StatelessWidget {
  selectorCircular(this.selector, {super.key});
  var selector;
  bool btn1 = false;
  bool btn2 = false;
  bool btn3 = false;
  @override
  Widget build(BuildContext context) {
    if (selector == 0) {
      btn1 = true;
      btn2 = false;
      btn3 = false;
    }
    if (selector == 1) {
      btn1 = false;
      btn2 = true;
      btn3 = false;
    }
    if (selector == 2) {
      btn1 = false;
      btn2 = false;
      btn3 = true;
    }
    double largura = MediaQuery.of(context).size.width;
    double responsive_size = 20;
    double responsive_geral = 0;
    if (largura < 1250) responsive_geral -= 10;
    if (largura < 800) responsive_geral -= 10;
    if (largura < 600) responsive_geral -= 0;
    if (largura < 1250) responsive_size -= 2;
    if (largura < 800) responsive_size -= 2;
    if (largura < 600) responsive_size -= 2;
    return Container(
      height: 50 + (responsive_geral),
      width: 130 + (responsive_geral * 2),
      // color: Colors.green,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
              width: responsive_size,
              height: responsive_size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF67968).withOpacity(btn1 ? 1 : .3),
              )),
          //
          Container(
              width: responsive_size,
              height: responsive_size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF67968).withOpacity(btn2 ? 1 : .3),
              )),
          //
          Container(
              width: responsive_size,
              height: responsive_size,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Color(0xffF67968).withOpacity(btn3 ? 1 : .3),
              )),
        ],
      ),
    );
  }
}
