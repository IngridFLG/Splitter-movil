import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/services/implements/resultado_service_impl.dart';
import 'package:splitter_movil_frontend/src/services/implements/tema_service_impl.dart';
import 'package:splitter_movil_frontend/src/services/implements/usuario_service_impl.dart';
import 'package:splitter_movil_frontend/src/services/mixins/resultado_service.dart';
import 'package:splitter_movil_frontend/src/services/mixins/tema_service.dart';
import 'package:splitter_movil_frontend/src/services/mixins/usuario_service.dart';

class ServicesProvider extends ChangeNotifier {
  final ResultadoService _resultadoService = ResultadoServiceImpl();
  final TemaService _temaService = TemaServiceImpl();
  final UsuarioService _usuarioService = UsuarioServiceImlp();


  ResultadoService get resultadoService {
    return _resultadoService;
  }

  TemaService get temaService {
    return _temaService;
  }

  UsuarioService get usuarioService {
    return _usuarioService;
  }

}
