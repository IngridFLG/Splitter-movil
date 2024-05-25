import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/pages/temas/equivalencia/equivalencia_page.dart';
import 'package:splitter_movil_frontend/src/pages/temas/fraccion/concepto_page.dart';
import 'package:splitter_movil_frontend/src/pages/temas/multi_dividir/multiplicar_page.dart';
import 'package:splitter_movil_frontend/src/pages/temas/simplificar/simplificar_page.dart';
import 'package:splitter_movil_frontend/src/pages/temas/sumar_restar/sumar_page.dart';
import 'package:splitter_movil_frontend/src/pages/temas/tema_inicio.dart';

final Map<String, Widget> _pages = {
  //inicio
  TemaInicio.name: const TemaInicio(),

  // Concepto de fracción
  ConceptoPage.name: const ConceptoPage(),

  // Simplificar fracciones
  SimplificarPage.name: const SimplificarPage(),

  // Fracciones equivalentes
  EquivalenciaPage.name: const EquivalenciaPage(),

  // Sumar y restar fracciones
  SumarPage.name: const SumarPage(),

  // Multiplicar y dividir fracciones
  MultiplicarPage.name: const MultiplicarPage(),
};

final Map<int, String> _index = {
  0: TemaInicio.name,
  1: TemaInicio.name,
  2: TemaInicio.name,
};

String getNamePageByIndex(int i) {
  if (i - 1 > _index.length) {
    throw Exception('Index fuera de rango');
  }
  String pageName = _index[i] ?? '';
  getPageByName(pageName);
  if (pageName == '') {
    throw Exception('La page asoaciado no está registrada.');
  }
  return pageName;
}

Widget getPageByName(String? name) {
  if (_pages.containsKey(name)) {
    return _pages[name]!;
  }
  throw Exception('La page no tiene asoaciado un widget.');
}
