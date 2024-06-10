import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/resultado_model.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/providers/services_provider.dart';
import 'package:splitter_movil_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjercicioSumaRestaPage extends StatefulWidget {
  static const name = "ejercicio-suma-resta-page";
  const EjercicioSumaRestaPage({super.key});

  @override
  State<EjercicioSumaRestaPage> createState() => _EjercicioSumaRestaPageState();
}

class _EjercicioSumaRestaPageState extends State<EjercicioSumaRestaPage> {
  List<int?> _selectedRespuestas = List<int?>.filled(4, null);
  List<Map<String, dynamic>> _preguntasSeleccionadas = [];

  final List<Map<String, dynamic>> _todasLasPreguntas = [
    {
      "pregunta":
          "¿Cuál de las siguientes fracciones corresponde a la siguiente suma, 2/7 + 3/7?",
      "respuestas": ["A) 5/7", "B) 6/7", "C) 7/7", "D) 4/7"],
      "correcta": 0
    },
    {
      "pregunta":
          "¿Cuál de las siguientes fracciones corresponde a la siguiente resta, 5/9 - 2/9?",
      "respuestas": ["A) 1/9", "B) 2/9", "C) 3/9", "D) 4/9"],
      "correcta": 2
    },
    {
      "pregunta":
          "¿Cuál de las siguientes fracciones corresponde a la siguiente suma, 1/4 + 2/5?",
      "respuestas": ["A) 9/20", "B) 7/20", "C) 11/20", "D) 3/20"],
      "correcta": 2
    },
    {
      "pregunta":
          "¿Cuál es el resultado al resolver la siguiente operación, 7/8 - 1/3 + 1/6?",
      "respuestas": ["A) 5/6", "B) 17/24", "C) 11/24", "D) 3/4"],
      "correcta": 1
    },
    {
      "pregunta":
          "¿Cuál es el resultado al resolver la siguiente operación, 3/5 + 2/3?",
      "respuestas": ["A) 11/15", "B) 5/8", "C) 1/2", "D) 7/15"],
      "correcta": 0
    },
    {
      "pregunta":
          "¿Cuál es el resultado al resolver la siguiente operación, 4/9 - 1/6?",
      "respuestas": ["A) 9/18", "B) 3/18", "C) 2/3", "D) 1/3"],
      "correcta": 1
    },
    {
      "pregunta":
          "¿Cuál es el resultado al sumar las siguientes fracciones, 2/3 + 3/4?",
      "respuestas": ["A) 5/12", "B) 10/12", "C) 5/7", "D) 7/12"],
      "correcta": 3
    },
    {
      "pregunta":
          "¿Cuál es el resultado al restar las siguientes fracciones, 5/6 - 2/3?",
      "respuestas": ["A) 1/6", "B) 1/3", "C) 3/6", "D) 2/6"],
      "correcta": 0
    },
    {
      "pregunta":
          "¿Cuál es el resultado al sumar las siguientes fracciones, 4/5 + 1/2?",
      "respuestas": ["A) 7/10", "B) 9/10", "C) 6/10", "D) 5/10"],
      "correcta": 1
    },
    {
      "pregunta":
          "¿Cuál es el resultado al restar las siguientes fracciones, 7/8 - 3/4?",
      "respuestas": ["A) 1/8", "B) 1/2", "C) 1/4", "D) 5/8"],
      "correcta": 3
    },
  ];

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    setState(() {
      _selectedRespuestas = List<int?>.filled(4, -1);
      _preguntasSeleccionadas = _seleccionarPreguntasAlAzar(4);
    });
  }

  List<Map<String, dynamic>> _seleccionarPreguntasAlAzar(int cantidad) {
    final random = Random();
    final indicesSeleccionados = <int>{};

    while (indicesSeleccionados.length < cantidad) {
      indicesSeleccionados.add(random.nextInt(_todasLasPreguntas.length));
    }

    return indicesSeleccionados
        .map((index) => _todasLasPreguntas[index])
        .toList();
  }

  void _handleRespuesta(int preguntaIndex, int respuestaIndex) {
    setState(() {
      _selectedRespuestas[preguntaIndex] = respuestaIndex;
    });
  }

  void _validarRespuestas() async {
    double puntaje = 0;

    for (int i = 0; i < _preguntasSeleccionadas.length; i++) {
      if (_selectedRespuestas[i] == _preguntasSeleccionadas[i]['correcta']) {
        puntaje += 25;
      }
    }

    String mensaje;
    String imagen;

    if (puntaje <= 100 && puntaje > 75) {
      mensaje = "¡Todas las respuestas son correctas! Puntaje: $puntaje";
      imagen = 'assets/imagenes/estrella4.png';
    } else if (puntaje <= 75 && puntaje > 50) {
      mensaje =
          "Muy bien, casi todas las respuestas son correctas. Puntaje: $puntaje";
      imagen = 'assets/imagenes/estrella3.png';
    } else if (puntaje <= 50 && puntaje > 25) {
      mensaje =
          "Bien hecho, la mayoría de las respuestas son correctas. Puntaje: $puntaje";
      imagen = 'assets/imagenes/estrella2.png';
    } else {
      mensaje = "Puntaje bajo. Inténtalo de nuevo. Puntaje: $puntaje";
      imagen = 'assets/imagenes/estrella2.png';
    }

    final usuarioProvider =
        // ignore: use_build_context_synchronously
        Provider.of<UsuarioProvider>(context, listen: false);

    String token = usuarioProvider.token!;
    int usuarioId = usuarioProvider.usuario!.id;
    int temaId =
        usuarioProvider.buscarTemaPorNombre("Sumar y restar fracciones")!;
    ResultadoformModel resultado = ResultadoformModel(
        puntaje: puntaje, idTema: temaId, idUsuario: usuarioId);

    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response = await servicePorvider.resultadoService
        .registrarResultado(token, resultado);

    if (response.type! == "success") {
      // ignore: use_build_context_synchronously
      showDialog(
        barrierDismissible: false,
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertaVolver(
          width: 200,
          height: 210,
          function: () {
            Navigator.of(context).pop();
            final navigator =
                Provider.of<NavigatorProvider>(context, listen: false);
            navigator.push(page: "tema-inicio-page");
          },
          widthButton: 30,
          textoBoton: 'Volver',
          image: Image.asset(imagen, height: 80),
          mensaje: mensaje,
          dobleBoton: false,
        ),
      );
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertaVolver(
          width: 200,
          height: 210,
          function: () {
            Navigator.of(context).pop();
          },
          widthButton: 30,
          textoBoton: 'Volver',
          image: Image.asset('assets/images/warning.jpg', height: 80),
          mensaje: response.msg,
          dobleBoton: false,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
            child: Padding(
                padding: const EdgeInsets.all(10),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Image.asset(
                            'assets/imagenes/Logo.png',
                          ),
                          texto('Splitter', fontExtraBold, 20, negroColor,
                              TextAlign.center)
                        ],
                      ),
                      separadorVertical(context, 1),
                      TemaWidget(
                          'tema4.png', 'Tema 4: Suma y Resta de Fracciones'),
                      separadorVertical(context, 2),
                      texto("Preguntas de selección", fontBold, 20, rojoColor,
                          TextAlign.center),
                      Divider(
                        color: rojoColor, // Color de la línea
                        thickness: 1, // Grosor de la línea
                        indent: 2, // Espaciado desde el borde izquierdo
                        endIndent: 2, // Espaciado desde el borde derecho
                      ),
                      separadorVertical(context, 3),
                      Expanded(
                          child: SingleChildScrollView(
                              child: Column(children: [
                        Column(
                            children: List.generate(
                                _preguntasSeleccionadas.length, (index) {
                          final pregunta = _preguntasSeleccionadas[index];
                          return Column(children: [
                            Pregunta(
                              pregunta: pregunta['pregunta'],
                              respuestas:
                                  List<String>.from(pregunta['respuestas']),
                              colorActivo: rojoColor,
                              onRespuestaSeleccionada: (int respuestaIndex) {
                                _handleRespuesta(index, respuestaIndex);
                              },
                            ),
                            separadorVertical(context, 3),
                            Divider(
                              color: rojoColor, // Color de la línea
                              thickness: 1, // Grosor de la línea
                              indent: 2, // Espaciado desde el borde izquierdo
                              endIndent: 2, // Espaciado desde el borde derecho
                            ),
                            separadorVertical(context, 3),
                          ]);
                        })),
                        separadorVertical(context, 3),
                        BotonAgregar(
                          textButton: "Enviar",
                          widthButton: 260,
                          heightButton: 50,
                          size: bigSize,
                          color: rojoColor,
                          hoverColor: rojoColor,
                          duration: 1000,
                          onTap: () async {
                            if (_selectedRespuestas.contains(-1)) {
                              showDialog(
                                context: context,
                                builder: (context) => AlertaVolver(
                                  width: 250,
                                  height: 200,
                                  function: () {
                                    Navigator.of(context).pop();
                                  },
                                  widthButton: 30,
                                  textoBoton: 'Volver',
                                  image: Image.asset(
                                      'assets/imagenes/warning.jpg',
                                      height: 80),
                                  mensaje:
                                      "Debes responder todas las preguntas",
                                  dobleBoton: false,
                                ),
                              );
                              return;
                            }
                            _validarRespuestas();
                          },
                        ),
                        separadorVertical(context, 3),
                      ])))
                    ]))));
  }
}
