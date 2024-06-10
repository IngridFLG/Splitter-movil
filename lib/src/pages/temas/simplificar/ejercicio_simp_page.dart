import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/resultado_model.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/providers/services_provider.dart';
import 'package:splitter_movil_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjercicioSimplificarPage extends StatefulWidget {
  static const name = "ejercicio-simplificar-page";
  const EjercicioSimplificarPage({super.key});

  @override
  State<EjercicioSimplificarPage> createState() =>
      _EjercicioSimplificarPageState();
}

class _EjercicioSimplificarPageState extends State<EjercicioSimplificarPage> {
  List<int?> _selectedRespuestas = List<int?>.filled(4, null);
  List<Map<String, dynamic>> _preguntasSeleccionadas = [];

  final List<Map<String, dynamic>> _todasLasPreguntas = [
    {
      "pregunta": "¿Qué significa simplificar una fracción?",
      "respuestas": [
        "A) Multiplicar el numerador y el denominador por el mismo número.",
        "B) Dividir el numerador y el denominador por su máximo común divisor (MCD).",
        "C) Sumar el numerador y el denominador.",
        "D) Restar el denominador del numerador."
      ],
      "correcta": 1
    },
    {
      "pregunta": "¿Cuál es el MCD de 8 y 12?",
      "respuestas": ["A) 2", "B) 6", "C) 4", "D) 8"],
      "correcta": 2
    },
    {
      "pregunta": "¿Cuál es la simplificación de 6/9?",
      "respuestas": ["A) 2/3", "B) 3/6", "C) 1/2", "D) 3/4"],
      "correcta": 0
    },
    {
      "pregunta":
          "¿Cuál de las siguientes fracciones está correctamente simplificada?",
      "respuestas": [
        "A) 10/20 = 1/2",
        "B) 15/25 = 5/10",
        "C) 18/24 = 3/4",
        "D) 8/12 = 4/5"
      ],
      "correcta": 0
    },
    {
      "pregunta": "¿Cuál es la fracción irreducible de 12/15?",
      "respuestas": ["A) 5/6", "B) 3/4", "C) 4/5", "D) 2/3"],
      "correcta": 3
    },
    {
      "pregunta": "Si simplificas la fracción 16/24, ¿cuál es el resultado?",
      "respuestas": ["A) 4/3", "B) 3/4", "C) 2/3", "D) 5/6"],
      "correcta": 2
    },
    {
      "pregunta": "¿Cuál es la fracción irreducible de 20/25?",
      "respuestas": ["A) 5/6", "B) 4/5", "C) 16/20", "D) 2/3"],
      "correcta": 1
    },
    {
      "pregunta":
          "¿Qué fracción es equivalente a 9/12 y está en su forma más simple?",
      "respuestas": ["A) 2/3", "B) 3/4", "C) 4/5", "D) 5/6"],
      "correcta": 0
    },
    {
      "pregunta": "¿Cuál es la fracción irreducible de 18/27?",
      "respuestas": ["A) 4/5", "B) 3/4", "C) 6/9", "D) 2/3"],
      "correcta": 3
    },
    {
      "pregunta": "¿Cuál es la simplificación de 15/20?",
      "respuestas": ["A) 5/6", "B) 4/5", "C) 3/4", "D) 6/7"],
      "correcta": 2
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
    int temaId = usuarioProvider.buscarTemaPorNombre("Simplificar fracciones")!;
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
          height: 150,
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
                      TemaWidget('tema2.png', 'Tema 2: Simplificar fracciones'),
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
                          child: Column(
                            children: [
                              Column(
                                  children: List.generate(
                                      _preguntasSeleccionadas.length, (index) {
                                final pregunta = _preguntasSeleccionadas[index];
                                return Column(children: [
                                  Pregunta(
                                    pregunta: pregunta['pregunta'],
                                    respuestas: List<String>.from(
                                        pregunta['respuestas']),
                                    colorActivo: rojoColor,
                                    onRespuestaSeleccionada:
                                        (int respuestaIndex) {
                                      _handleRespuesta(index, respuestaIndex);
                                    },
                                  ),
                                  separadorVertical(context, 3),
                                  Divider(
                                    color: rojoColor, // Color de la línea
                                    thickness: 1, // Grosor de la línea
                                    indent:
                                        2, // Espaciado desde el borde izquierdo
                                    endIndent:
                                        2, // Espaciado desde el borde derecho
                                  ),
                                  separadorVertical(context, 3),
                                ]);
                              })),
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
                            ],
                          ),
                        ),
                      )
                    ]))));
  }
}
