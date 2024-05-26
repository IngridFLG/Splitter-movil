import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/response_model.dart';
import 'package:splitter_movil_frontend/src/models/usuario_model.dart';
import 'package:splitter_movil_frontend/src/services/mixins/usuario_service.dart';

class UsuarioServiceImlp with UsuarioService {
  @override
  Future<UsuarioModel> detalleUsuario(String correo, String token) async {
    final String url = '$urlBase/splitter/v1/usuario/detalle?correo=$correo';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    final responseBody = json.decode(response.body);
    final UsuarioModel usuarioModel =
        UsuarioModel.fromJson(responseBody["msg"]);

    return usuarioModel;
  }

  @override
  Future<Response> login(LoginModel loginRequest) async {
    final String url = '$urlBase/login';

    final Map<String, String> headers = {
      'Content-Type': 'application/json',
    };

    final response = await http.post(
      Uri.parse(url),
      headers: headers,
      body: jsonEncode(loginRequest),
    );

    final responseBody = json.decode(response.body);
    final Response respuesta = Response.fromJson(responseBody);

    return respuesta;
  }
}