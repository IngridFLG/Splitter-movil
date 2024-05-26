
import 'package:splitter_movil_frontend/src/models/tema_model.dart';

mixin TemaService {
  Future<List<TemaModel>> listarTemas(String token);

}
