import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjercicioMultiDividirPage extends StatefulWidget {
  static const name = "ejercicio-multi-dividir-page";
  const EjercicioMultiDividirPage({super.key});

  @override
  State<EjercicioMultiDividirPage> createState() =>
      _EjercicioMultiDividirPageState();
}

class _EjercicioMultiDividirPageState extends State<EjercicioMultiDividirPage> {
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
    //final navigator = Provider.of<NavigatorProvider>(context, listen: false);

    List<String> respuestas1 = ["A) 6/49", "B) 5/49", "C) 4/49", "D) 9/49"]; //A

    List<String> respuestas2 = ["A) 5/2", "B) 9/2", "C) 5/4", "D) 9/4"]; //A

    List<String> respuestas3 = ["A) 2/20", "B) 3/20", "C) 1/10", "D) 2/10"];// C

    List<String> respuestas4 = ["A) 8/30", "B) 8/15", "C) 4/15", "D) 16/15"]; // D

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
                      TemaWidget('tema5.png',
                          'Tema 5: Multiplicar y Dividir Fracciones'),
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
                        Pregunta(
                          pregunta:
                              "¿Cuál es el resultado de multiplicar las siguientes fracciones, 2/7 y 3/7?",
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
                          endIndent: 2, // Espaciado desde el borde derecho
                        ),
                        separadorVertical(context, 3),
                        Pregunta(
                          pregunta:
                              "Selecciona el resultado de dividir la fracción 5/9 entre 2/9.",
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
                          endIndent: 2, // Espaciado desde el borde derecho
                        ),
                        separadorVertical(context, 3),
                        Pregunta(
                          pregunta:
                              "¿Qué fracción resulta de multiplicar 1/4 por 2/5?",
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
                          endIndent: 2, // Espaciado desde el borde derecho
                        ),
                        separadorVertical(context, 3),
                        Pregunta(
                          pregunta:
                              "Resuelve la siguiente operación, y selecciona su respuesta\n(2/3 * 4/5) ÷ 1/2",
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
                          endIndent: 2, // Espaciado desde el borde derecho
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
                      ])))
                    ]))));
  }
}
