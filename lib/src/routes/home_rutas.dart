import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/pages/temas/tema_inicio.dart';

final Map<String, Widget> _pages = {
  //inicio
  TemaInicio.name: const TemaInicio(),
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
