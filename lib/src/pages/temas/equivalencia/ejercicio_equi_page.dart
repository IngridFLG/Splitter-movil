import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/resultado_model.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/providers/services_provider.dart';
import 'package:splitter_movil_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';
import 'dart:math';

class EjercicioEquivalenciaPage extends StatefulWidget {
  static const name = "ejercicio-equivalencia-page";
  const EjercicioEquivalenciaPage({super.key});

  @override
  State<EjercicioEquivalenciaPage> createState() =>
      _EjercicioEquivalenciaPageState();
}

class _EjercicioEquivalenciaPageState extends State<EjercicioEquivalenciaPage> {
  List<int?> _selectedRespuestas = List<int?>.filled(4, null);
  List<Map<String, dynamic>> _preguntasSeleccionadas = [];

  final List<Map<String, dynamic>> _todasLasPreguntas = [
    {
      "pregunta": "¿Cuál de las siguientes fracciones es equivalente a 2/3?",
      "respuestas": ["A) 3/5", "B) 4/6", "C) 5/7", "D) 6/9"],
      "correcta": 3
    },
    {
      "pregunta": "¿Son equivalentes las fracciones 4/9 y 8/18?",
      "respuestas": ["A) Sí", "B) No"],
      "correcta": 0
    },
    {
      "pregunta": "¿Qué fracción equivalente a 1/2 tiene un denominador de 16?",
      "respuestas": ["A) 7/16", "B) 8/16", "C) 6/16", "D) 5/16"],
      "correcta": 1
    },
    {
      "pregunta":
          "¿Cuál es la fracción equivalente a 4/5 con un denominador de 25?",
      "respuestas": ["A) 8/25", "B) 10/25", "C) 16/25", "D) 20/25"],
      "correcta": 3
    },
    {
      "pregunta":
          "¿Cuál es la fracción equivalente a 3/4 con un denominador de 8?",
      "respuestas": ["A) 4/8", "B) 5/8", "C) 6/8", "D) 3/8"],
      "correcta": 2
    },
    {
      "pregunta": "¿Son equivalentes las fracciones 5/10 y 1/2?",
      "respuestas": ["A) No", "B) Sí"],
      "correcta": 1
    },
    {
      "pregunta": "¿Qué fracción equivalente a 2/3 tiene un numerador de 8?",
      "respuestas": ["A) 8/12", "B) 8/9", "C) 8/10", "D) 8/15"],
      "correcta": 3
    },
    {
      "pregunta":
          "¿Cuál es la fracción equivalente a 7/8 con un denominador de 16?",
      "respuestas": ["A) 12/16", "B) 14/16", "C) 10/16", "D) 9/16"],
      "correcta": 1
    },
    {
      "pregunta":
          "¿Cuál es la fracción equivalente a 5/6 con un numerador de 10?",
      "respuestas": ["A) 10/12", "B) 10/11", "C) 10/13", "D) 10/14"],
      "correcta": 0
    },
    {
      "pregunta": "¿Cuál de las siguientes fracciones es equivalente a 7/9?",
      "respuestas": ["A) 14/20", "B) 14/19", "C) 14/18", "D) 14/21"],
      "correcta": 2
    }
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
                      TemaWidget(
                          'tema3.png', 'Tema 3: Fracciones equivalentes'),
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
