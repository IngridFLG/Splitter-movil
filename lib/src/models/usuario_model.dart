import 'dart:convert';

LoginModel authModelFromJson(String str) =>
    LoginModel.fromJson(json.decode(str));

String authModelToJson(LoginModel data) => json.encode(data.toJson());

class LoginModel {
  final String correo;
  final String contrasena;

  LoginModel({
    required this.correo,
    required this.contrasena,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) => LoginModel(
        correo: json["correo"],
        contrasena: json["contrasena"],
      );

  Map<String, dynamic> toJson() => {
        "correo": correo,
        "contrasena": contrasena,
      };
}

UsuarioModel usuarioModelFromJson(String str) =>
    UsuarioModel.fromJson(json.decode(str));

String usuarioModelToJson(UsuarioModel data) => json.encode(data.toJson());

class UsuarioModel {
  int id;
  String nombre;
  String apellido;
  String correo;

  UsuarioModel({
    required this.id,
    required this.nombre,
    required this.apellido,
    required this.correo,
  });

  factory UsuarioModel.fromJson(Map<String, dynamic> json) => UsuarioModel(
        id: json["id"],
        nombre: json["nombre"],
        apellido: json["apellido"],
        correo: json["correo"],
      );

  Map<String, dynamic> toJson() => {
        "id": id,
        "nombre": nombre,
        "apellido": apellido,
        "correo": correo,
      };
}