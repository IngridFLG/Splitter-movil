import 'dart:math';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/resultado_model.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/providers/services_provider.dart';
import 'package:splitter_movil_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjercicioConceptoPage extends StatefulWidget {
  static const name = "ejercicio-concepto-page";
  const EjercicioConceptoPage({super.key});

  @override
  State<EjercicioConceptoPage> createState() => _EjercicioConceptoPageState();
}

class _EjercicioConceptoPageState extends State<EjercicioConceptoPage> {
  List<int?> _selectedRespuestas = List<int?>.filled(4, null);
  List<Map<String, dynamic>> _preguntasSeleccionadas = [];

  final List<Map<String, dynamic>> _todasLasPreguntas = [
    {
      "pregunta": "¿Qué representa el numerador en una fracción?",
      "respuestas": [
        "A) La cantidad total de partes en que se divide el todo.",
        "B) La cantidad de partes que se toman del total.",
        "C) El tipo de fracción.",
        "D) La línea que separa el numerador del denominador."
      ],
      "correcta": 1
    },
    {
      "pregunta": "¿Cómo se lee la fracción 5/6?",
      "respuestas": [
        "A) Cinco de seis.",
        "B) Seis de cinco.",
        "C) Cinco por seis",
        "D) Seis por cinco."
      ],
      "correcta": 0
    },
    {
      "pregunta":
          "Si divides una pizza en 8 partes iguales y tomas 3 partes, ¿qué fracción de la pizza has tomado?",
      "respuestas": ["A) 3/5", "B) 8/3", "C) 1/3", "D) 3/8"],
      "correcta": 3
    },
    {
      "pregunta": "¿Qué representa el denominador en una fracción?",
      "respuestas": [
        "A) La cantidad de partes que se toman del total.",
        "B) El tipo de fracción.",
        "C) La cantidad total de partes en que se divide el todo.",
        "D) La línea que separa el numerador del denominador."
      ],
      "correcta": 2
    },
    {
      "pregunta":
          "¿Qué fracción representa una parte de un todo dividido en 4 partes iguales?",
      "respuestas": ["A) 1/2", "B) 1/3", "C) 1/4", "D) 1/5"],
      "correcta": 2
    },
    {
      "pregunta":
          "Si un pastel se corta en 6 partes iguales y te comes 4 partes, ¿qué fracción del pastel has comido?",
      "respuestas": ["A) 4/6", "B) 2/3", "C) 1/3", "D) 5/6"],
      "correcta": 1
    },
    {
      "pregunta":
          "¿Cómo se llama una fracción donde el numerador es mayor que el denominador?",
      "respuestas": [
        "A) Fracción propia",
        "B) Fracción impropia",
        "C) Fracción mixta",
        "D) Fracción decimal"
      ],
      "correcta": 1
    },
    {
      "pregunta": "¿Cuál es el valor de la fracción 3/3?",
      "respuestas": ["A) 0", "B) 1", "C) 3", "D) Ninguno de los anteriores"],
      "correcta": 1
    },
    {
      "pregunta":
          "Si una fracción tiene un numerador de 5 y un denominador de 15, ¿cuál es la fracción simplificada?",
      "respuestas": ["A) 1/3", "B) 5/3", "C) 1/5", "D) 3/5"],
      "correcta": 0
    },
    {
      "pregunta": "¿Qué fracción representa el número uno?",
      "respuestas": ["A) 1/10", "B) 10/10", "C) 1/100", "D) 100/100"],
      "correcta": 1
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
    int temaId = usuarioProvider.buscarTemaPorNombre("Concepto de fracción")!;
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
                      TemaWidget('tema1.png', 'Tema 1: Concepto de fracción'),
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
