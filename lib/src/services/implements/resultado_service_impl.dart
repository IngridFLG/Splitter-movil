import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/response_model.dart';
import 'package:splitter_movil_frontend/src/models/resultado_model.dart';
import 'package:splitter_movil_frontend/src/services/mixins/resultado_service.dart';

class ResultadoServiceImpl with ResultadoService {
  @override
  Future<Response> registrarResultado(
      String token, ResultadoformModel resultado) async {
    final String url = '$urlBase/splitter/v1/resultados/guardarResultado';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.post(Uri.parse(url),
        headers: headers, body: jsonEncode(resultado));

    final responseBody = json.decode(response.body);
    final Response respuesta = Response.fromJson(responseBody);

    return respuesta;
  }

  @override
  Future<List<ResultadosModel>> listarResultados(
      String token, Map<String, dynamic> resultados) async {
    final String url = '$urlBase/splitter/v1/resultados/results';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final request = http.Request(
      'GET',
      Uri.parse(url),
    )..headers.addAll(headers);
    request.body = jsonEncode(resultados);
    final response  = await request.send();

    if (response.statusCode == 200) {
      final responseBody = await response.stream.bytesToString();
      final decoded = jsonDecode(responseBody);
      List<ResultadosModel> resultados = List<ResultadosModel>.from(
        decoded.map((json) => ResultadosModel.fromJson(json)),
      );
      return resultados;
    } else {
      return [];
    }
  }
}
