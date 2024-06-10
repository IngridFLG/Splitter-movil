
import 'package:splitter_movil_frontend/src/models/response_model.dart';
import 'package:splitter_movil_frontend/src/models/resultado_model.dart';

mixin ResultadoService {
  Future<Response> registrarResultado(String token, ResultadoformModel resultado);

  Future<List<ResultadosModel>> listarResultados(String token, int idUsuario, int idTema);
}