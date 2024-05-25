import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjercicioSimplificarPage extends StatefulWidget {
  static const name = "ejercicio-simplificar-page";
  const EjercicioSimplificarPage({super.key});

  @override
  State<EjercicioSimplificarPage> createState() =>
      _EjercicioSimplificarPageState();
}

class _EjercicioSimplificarPageState extends State<EjercicioSimplificarPage> {
  int? _selectedRespuesta1;
  int? _selectedRespuesta2;
  int? _selectedRespuesta3;
  int? _selectedRespuesta4;

  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() {
    setState(() {
      _selectedRespuesta1 = -1;
      _selectedRespuesta2 = -1;
      _selectedRespuesta3 = -1;
      _selectedRespuesta4 = -1;
    });
  }

  void _handleRespuesta(int index, Function(int) updateSelected) {
    setState(() {
      updateSelected(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Provider.of<NavigatorProvider>(context, listen: false);

    List<String> respuestas1 = [
      "A) Multiplicar el numerador y el denominador por el mismo número.",
      "B) Dividir el numerador y el denominador por su máximo común divisor (MCD).",
      "C) Sumar el numerador y el denominador.",
      "D) Restar el denominador del numerador."
    ];

    List<String> respuestas2 = ["A) 2", "B) 6", "C) 4", "D) 8"];

    List<String> respuestas3 = ["A) 2/3", "B) 3/6", "C) 1/2", "D) 3/4"];

    List<String> respuestas4 = [
      "A) 10/20 = 1/2",
      "B) 15/25 = 5/10",
      "C) 18/24 = 3/4",
      "D) 8/12 = 4/5"
    ];

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
                              Pregunta(
                                pregunta:
                                    "¿Qué significa simplificar una fracción?",
                                respuestas: respuestas1,
                                colorActivo: rojoColor,
                                onRespuestaSeleccionada: (int index) {
                                  _handleRespuesta(index, (newValue) {
                                    _selectedRespuesta1 = newValue;
                                  });
                                },
                              ),
                              separadorVertical(context, 3),
                              Divider(
                                color: rojoColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              separadorVertical(context, 3),
                              Pregunta(
                                pregunta: "¿Cuál es el MCD de 8 y 12?",
                                respuestas: respuestas2,
                                colorActivo: rojoColor,
                                onRespuestaSeleccionada: (int index) {
                                  _handleRespuesta(index, (newValue) {
                                    _selectedRespuesta2 = newValue;
                                  });
                                },
                              ),
                              separadorVertical(context, 3),
                              Divider(
                                color: rojoColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              separadorVertical(context, 3),
                              Pregunta(
                                pregunta: "¿Cuál es la simplificación de 6/9?",
                                respuestas: respuestas3,
                                colorActivo: rojoColor,
                                onRespuestaSeleccionada: (int index) {
                                  _handleRespuesta(index, (newValue) {
                                    _selectedRespuesta3 = newValue;
                                  });
                                },
                              ),
                              separadorVertical(context, 3),
                              Divider(
                                color: rojoColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
                              separadorVertical(context, 3),
                              Pregunta(
                                pregunta:
                                    "¿Cuál de las siguientes fracciones está correctamente simplificada?",
                                respuestas: respuestas4,
                                colorActivo: rojoColor,
                                onRespuestaSeleccionada: (int index) {
                                  _handleRespuesta(index, (newValue) {
                                    _selectedRespuesta4 = newValue;
                                  });
                                },
                              ),
                              separadorVertical(context, 3),
                              Divider(
                                color: rojoColor, // Color de la línea
                                thickness: 1, // Grosor de la línea
                                indent: 2, // Espaciado desde el borde izquierdo
                                endIndent:
                                    2, // Espaciado desde el borde derecho
                              ),
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
                                  if (_selectedRespuesta1 == -1 ||
                                      _selectedRespuesta2 == -1 ||
                                      _selectedRespuesta3 == -1 ||
                                      _selectedRespuesta4 == -1) {
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
