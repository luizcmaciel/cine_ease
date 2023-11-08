import 'package:flutter/material.dart';

enum Classification {
  livre('Livre', 'L', Colors.white, Colors.green),
  naoRecomendado10('10', '10', Colors.black, Colors.blueAccent),
  naoRecomendado12('12', '12', Colors.black, Colors.yellowAccent),
  naoRecomendado14('14', '14', Colors.black, Colors.orangeAccent),
  naoRecomendado16('16', '16', Colors.black, Colors.redAccent),
  naoRecomendado18('18', '18', Colors.white, Colors.black);

  final String classification;
  final String code;
  final Color foregroundColor;
  final Color backgroundColor;

  const Classification(
    this.classification,
    this.code,
    this.foregroundColor,
    this.backgroundColor,
  );
}
