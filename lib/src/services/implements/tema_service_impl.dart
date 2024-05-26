import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/tema_model.dart';
import 'package:splitter_movil_frontend/src/services/mixins/tema_service.dart';

class TemaServiceImpl with TemaService {
  @override
  Future<List<TemaModel>> listarTemas(String token) async {
    final String url = '$urlBase/splitter/v1/temas/all';

    final headers = <String, String>{
      'Content-Type': 'application/json',
      'Authorization': 'Bearer $token'
    };

    final response = await http.get(
      Uri.parse(url),
      headers: headers,
    );

    if (response.statusCode == 200) {
      final dynamic decodedData = json.decode(response.body);
      final List<dynamic> temasJson = decodedData["msg"];
      final List<TemaModel> temas =
          temasJson.map((jsonItem) => TemaModel.fromJson(jsonItem)).toList();
      return temas;
    } else {
      return [];
    }
  }
}
