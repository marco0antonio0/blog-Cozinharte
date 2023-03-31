import 'package:blog_grupo/controller/controllerPages.dart';
import 'package:blog_grupo/dB/data.dart';
import 'package:blog_grupo/view/widget.dart';
import 'package:flutter/material.dart';

Items instance1 = Items.instance;
Backend instance = Backend.instance;

//  modificando
class Bloco_1_2 extends StatefulWidget {
  const Bloco_1_2({super.key});

  @override
  State<Bloco_1_2> createState() => _Bloco_1_2State();
}

class _Bloco_1_2State extends State<Bloco_1_2> {
  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    return Container(
      width: largura,
      child: Column(
        children: [bloco_1(largura), bloco_2()],
      ),
    );
  }
}

Widget bloco_1(largura) {
  double responsive = 0;
  if (largura < 1750) responsive -= 100;
  if (largura < 1750) responsive -= 100;
  if (largura < 1400) responsive -= 100;
  if (largura < 1300) responsive -= 200;
  if (largura < 1100) responsive -= 200;
  if (largura < 900) responsive -= 200;
  return Container(
    height: 120 + (responsive * 0.05),
    color: Color(0xffF6A168),
    margin: EdgeInsets.symmetric(vertical: 30 + (responsive * 0.01)),
    child: Center(
      child: textPerson(
          text: 'CURIOSIDADES',
          color: Colors.white,
          fontSize: 35 + (responsive * 0.009)),
    ),
  );
}

class bloco_2 extends StatelessWidget {
  const bloco_2({super.key});

  @override
  Widget build(BuildContext context) {
    double largura = MediaQuery.of(context).size.width;
    double responsive = 0;
    if (largura < 1750) responsive -= 100;
    if (largura < 1750) responsive -= 100;
    if (largura < 1400) responsive -= 100;
    if (largura < 1300) responsive -= 200;
    if (largura < 1100) responsive -= 200;
    if (largura < 900) responsive -= 200;
    print(largura);
    return Container(
      height: 400 + (responsive * 0.2),
      width: 1500 + responsive,
      margin: EdgeInsets.symmetric(vertical: 10),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(40), color: Color(0xffF6A168)),
      child: Row(children: [
        Spacer(flex: 5),
        //==============================
        // image
        Expanded(
            flex: largura > 950 ? 50 : 70,
            child: Container(
              // color: Colors.red,
              child: Container(
                margin: EdgeInsets.all(40 + (responsive * .03)),
                decoration: BoxDecoration(
                    color: Color(0xffCB7923).withOpacity(.2),
                    image: DecorationImage(
                        image: AssetImage(instance1.data[0]['image']!),
                        fit: BoxFit.scaleDown),
                    borderRadius: BorderRadius.circular(40)),
              ),
            )),
        Spacer(flex: 5),
        //==============================
        // textcolunm
        Expanded(
            flex: 100,
            child: Container(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  textPerson(
                      text: curiosidades,
                      color: Colors.black,
                      fontSize: 20 + (responsive * .008))
                ],
              ),
            )),
        Spacer(flex: 5),
      ]),
    );
  }
}
