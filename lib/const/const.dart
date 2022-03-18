import 'package:flutter/material.dart';

Color greenAccent = const Color.fromARGB(255, 91, 240, 91);
Color buttonBackground = const Color.fromRGBO(227, 247, 222, 1);

List<BoxShadow> get shadows {
  return [
    BoxShadow(
        blurRadius: 5,
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0, -7),
        spreadRadius: -3)
  ];
}

List<BoxShadow> get textshadows {
  return [
    BoxShadow(
        blurRadius: 10,
        color: Colors.black.withOpacity(0.2),
        offset: const Offset(0, -7),
        spreadRadius: -10)
  ];
}
