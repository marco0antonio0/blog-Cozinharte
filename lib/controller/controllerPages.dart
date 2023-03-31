import 'package:flutter/material.dart';

import '../dB/data.dart';

class Backend {
  Backend._();
  static final Backend instance = Backend._();
  PageController controllerImage = PageController();
}

class Items {
  Items._();
  static final Items instance = Items._();
  List<Map<String, String>> data = [receita1];
}
