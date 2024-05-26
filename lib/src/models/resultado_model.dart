import 'dart:convert';

ResultadoformModel resultadoformModelFromJson(String str) => ResultadoformModel.fromJson(json.decode(str));

String resultadoformModelToJson(ResultadoformModel data) => json.encode(data.toJson());

class ResultadoformModel {
    double puntaje;
    int idTema;
    int idUsuario;

    ResultadoformModel({
        required this.puntaje,
        required this.idTema,
        required this.idUsuario,
    });

    factory ResultadoformModel.fromJson(Map<String, dynamic> json) => ResultadoformModel(
        puntaje: json["puntaje"]?.toDouble(),
        idTema: json["idTema"],
        idUsuario: json["idUsuario"],
    );

    Map<String, dynamic> toJson() => {
        "puntaje": puntaje,
        "idTema": idTema,
        "idUsuario": idUsuario,
    };
}


ResultadosModel resultadosModelFromJson(String str) => ResultadosModel.fromJson(json.decode(str));

String resultadosModelToJson(ResultadosModel data) => json.encode(data.toJson());

class ResultadosModel {
    int id;
    double puntaje;
    int idTema;
    int idUsuario;

    ResultadosModel({
        required this.id,
        required this.puntaje,
        required this.idTema,
        required this.idUsuario,
    });

    factory ResultadosModel.fromJson(Map<String, dynamic> json) => ResultadosModel(
        id: json["id"],
        puntaje: json["puntaje"]?.toDouble(),
        idTema: json["idTema"],
        idUsuario: json["idUsuario"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "puntaje": puntaje,
        "idTema": idTema,
        "idUsuario": idUsuario,
    };
}
