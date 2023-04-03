import 'package:flutter/material.dart';

import '../dB/data.dart';

class Backend {
  Backend._();
  static final Backend instance = Backend._();
  PageController controllerImage = PageController();
  var data;
  List pratosPrincipais = [];
  List cardsList = [];
  filter() {
    //====================================================
    for (var i = 0; i < data.length; i++) {
      if (data[i]['tipo'] == 'carrosel') pratosPrincipais.add(data[i]);
      if (data[i]['tipo'] == 'card') cardsList.add(data[i]);
    }
    //====================================================

    //====================================================
  }
}

class Items {
  Items._();
  static final Items instance = Items._();
  List<Map<String, String>> data = [receita1];
  var data_now;
}
