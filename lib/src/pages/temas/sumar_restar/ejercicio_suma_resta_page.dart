import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjercicioSumaRestaPage extends StatefulWidget {
  static const name = "ejercicio-suma-resta-page";
  const EjercicioSumaRestaPage({super.key});

  @override
  State<EjercicioSumaRestaPage> createState() => _EjercicioSumaRestaPageState();
}

class _EjercicioSumaRestaPageState extends State<EjercicioSumaRestaPage> {
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

    List<String> respuestas1 = ["A) 5/7", "B) 6/7", "C) 7/7", "D) 4/7"];

    List<String> respuestas2 = ["A) 3/9", "B) 2/9", "C) 1/9", "D) 4/9"];

    List<String> respuestas3 = ["A) 9/20", "B) 7/20", "C) 11/20", "D) 3/20"];

    List<String> respuestas4 = ["A) 5/6", "B) 17/24", "C) 11/24", "D) 3/4"];

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
                        Pregunta(
                          pregunta:
                              "¿Cuál de las siguientes fracciones corresponde a la siguiente suma, 2/7 + 3/7?",
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
                              "¿Cuál de las siguientes fracciones corresponde a la siguiente resta, 5/9 - 2/9?",
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
                              "¿Cuál de las siguientes fracciones corresponde a la siguiente suma, 1/4 + 2/5?",
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
                              "¿Cuál es el resultado al resolver la siguiente operación, 7/8 - 1/3 + 1/6?",
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
