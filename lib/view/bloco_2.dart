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
        bloco_0(largura),
        Container(
          height: 30,
        ),
        bloco_1(responsive)
      ],
    );
  }
}

Widget bloco_0(largura) {
  print(largura);
  double responsive_largura = 1000;
  double responsive_altura = 500;
  if (largura < 1065) responsive_largura -= 100;
  if (largura <= 935) responsive_largura -= 100;
  if (largura <= 827) responsive_largura -= 100;
  if (largura <= 725) responsive_largura -= 100;
  if (largura <= 600) responsive_largura -= 100;
  if (largura <= 500) responsive_largura -= 100;
  //=============================================
  if (largura < 922) responsive_altura -= 100;
/*   if (largura < 725) responsive_altura -= 100;
  if (largura < 725) responsive_altura -= 100; */
  String issoeotexto =
      "CHEF ISADORA OLIVEIRA, UMA RENOMADA CHEF DE COZINHA FORMADA EM GASTRONOMIA PELA PRESTIGIADA Escola Le CORDON BLEU EM PARIS.";
  String issoeotexto2 =
      "Com uma paixão avassaladora pela culinária desde criança, Isadora sempre esteve à frente das panelas, experimentando novos ingredientes, combinações de sabores e criando pratos incríveis. Com anos de experiência em cozinhas de renomados restaurantes internacionais, Isadora decidiu que era hora de compartilhar seus conhecimentos e sua paixão pela culinária com o mundo. Foi assim que ela decidiu criar seu blog de receitas culinárias, onde busca inspirar e incentivar pessoas de todos os lugares a experimentar novas receitas e criar momentos inesquecíveis ao redor da mesa. Em seu blog, Isadora oferece uma variedade de receitas, desde opções simples e rápidas para o dia a dia até pratos elaborados e sofisticados para ocasiões especiais. Ela acredita que a comida é uma forma de amor e que cada prato que preparamos deve ser feito com cuidado, amor e dedicação. Seu vasto conhecimento em gastronomia e sua paixão pela culinária, Isadora promete trazer a vocês uma experiência única e saborosa. Junte-se a ela nessa jornada culinária e descubra novos sabores e possibilidades na cozinha!";
  return Container(
    child: Row(
      children: [
        Container(
          height: responsive_altura,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Column(
            children: [
              Container(
                height: responsive_altura * 0.4,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    image: DecorationImage(
                        image: AssetImage("images/imagemtext_bloco0.jpg"))),
              ),
              Container(
                width: responsive_largura * 0.3,
                margin: EdgeInsets.only(top: 30),
                child: Text(
                  issoeotexto,
                  textAlign: TextAlign.justify,
                ),
              )
            ],
          ),
          width: responsive_largura * 0.4,
        ),
        Container(
          height: responsive_altura,
          padding: EdgeInsets.symmetric(horizontal: 40, vertical: 10),
          child: Text(
            issoeotexto2,
            textAlign: TextAlign.justify,
          ),
          width: responsive_largura * 0.6,
        ),
      ],
    ),
    width: responsive_largura,
    decoration: BoxDecoration(
        color: Color(0xffF8B182), borderRadius: BorderRadius.circular(30)),
    height: responsive_altura,
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

Widget img_person() {
  return Container(
      child: Image(image: AssetImage('Images/imagemtext_bloco0.jpg')));
}
