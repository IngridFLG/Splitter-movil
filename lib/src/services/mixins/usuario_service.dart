

import 'package:splitter_movil_frontend/src/models/response_model.dart';
import 'package:splitter_movil_frontend/src/models/usuario_model.dart';

mixin UsuarioService {
  Future<Response> login(LoginModel loginRequest);
  Future<UsuarioModel> detalleUsuario(String correo, String token);
}
