import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/pages/pages.dart';


final Map<String, Widget> _pages = {
  //inicio
  TemaInicio.name: const TemaInicio(),

  // Concepto de fracción
  ConceptoPage.name: const ConceptoPage(),
  EjemploConceptoPage.name: const EjemploConceptoPage(),
  EjercicioConceptoPage.name: const EjercicioConceptoPage(),

  // Simplificar fracciones
  SimplificarPage.name: const SimplificarPage(),
  EjemplosSimplificarPage.name: const EjemplosSimplificarPage(),
  EjercicioSimplificarPage.name: const EjercicioSimplificarPage(),

  // Fracciones equivalentes
  EquivalenciaPage.name: const EquivalenciaPage(),
  EjercicioEquivalenciaPage.name: const EjercicioEquivalenciaPage(),

  // Sumar y restar fracciones
  SumarPage.name: const SumarPage(),
  EjercicioSumaRestaPage.name: const EjercicioSumaRestaPage(),

  // Multiplicar y dividir fracciones
  MultiplicarPage.name: const MultiplicarPage(),
  EjercicioMultiDividirPage.name: const EjercicioMultiDividirPage(),

  // Resultados
  ResultadosPage.name: const ResultadosPage(),
};

final Map<int, String> _index = {
  0: ResultadosPage.name,
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
