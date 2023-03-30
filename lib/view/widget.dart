import 'package:flutter/material.dart';

//==========================================================================
SelectableText textPerson(
    {text = '',
    fontSize = 20,
    fontWeight = null,
    color = const Color(0xffEC998E),
    fontStyle = FontStyle.normal,
    TextAlign = TextAlign.left}) {
  return SelectableText(
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
