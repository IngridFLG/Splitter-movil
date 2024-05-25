import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EquivalenciaPage extends StatefulWidget {
  static const name = "equivalencia-page";
  const EquivalenciaPage({super.key});

  @override
  State<EquivalenciaPage> createState() => _EquivalenciaPageState();
}

class _EquivalenciaPageState extends State<EquivalenciaPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final navigator = Provider.of<NavigatorProvider>(context, listen: false);

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
                    TemaWidget('tema3.png', 'Tema 3: Fracciones equivalentes'),
                    separadorVertical(context, 1),
                    Expanded(
                        child: SingleChildScrollView(
                      child: Column(
                        children: [
                          SizedBox(
                              width: size.width * 0.9,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "En esta aventura, aprenderemos que son ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "las fracciones equivalentes ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: rojoColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "y cómo encontrarlas.",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          separadorVertical(context, 3),
                          Divider(
                            color: rojoColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 3),
                          SizedBox(
                              width: size.width * 0.9,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Las fracciones equivalentes son aquellas que, aunque tienen diferentes numeradores y denominadores, ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "representan la misma cantidad o el mismo valor. ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: rojoColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Esto ocurre porque la relación entre el numerador y el denominador es la misma en ambas fracciones.",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          Image.asset(
                            "assets/imagenes/equivalentes.jpg",
                            width: 350,
                          ),
                          separadorVertical(context, 3),
                          Divider(
                            color: rojoColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 3),
                          SizedBox(
                              width: size.width * 0.9,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Por ejemplo, las fracciones 1/2 y 2/4 ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "son equivalentes. ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: rojoColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Para comprobarlo, podemos simplificar 2/4",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          separadorVertical(context, 1),
                          SizedBox(
                            width: size.width * 0.6,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                texto("Fracción original: 2/4", fontBold,
                                    bigSize, negroColor, TextAlign.start),
                                texto("MCD = 2", fontBold, bigSize, negroColor,
                                    TextAlign.start),
                                texto("Fracción simplificada: 1/2", fontBold,
                                    bigSize, negroColor, TextAlign.start),
                              ],
                            ),
                          ),
                          separadorVertical(context, 1),
                          SizedBox(
                              width: size.width * 0.9,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Ambas fracciones tienen el mismo valor. Esto se aplica a cualquier par de fracciones. ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text: "La clave está en simplificarlas ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: rojoColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "para obtener fracciones equivalentes.",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          separadorVertical(context, 3),
                          Divider(
                            color: rojoColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 3),
                          SizedBox(
                              width: size.width * 0.9,
                              child: RichText(
                                textAlign: TextAlign.center,
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text:
                                          "Ahora, comprueba tú mismo si estas fracciones son equivalentes.",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: rojoColor,
                                      ),
                                    ),
                                  ],
                                ),
                              )),
                          SizedBox(
                              width: size.width * 0.8,
                              child: Column(
                                children: [
                                  texto("3/6 y 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("2/5 y 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("4/8 y 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("5/10 y 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                ],
                              )),
                          separadorVertical(context, 3),
                          Divider(
                            color: rojoColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 3),
                          BotonAgregar(
                            textButton: "Probar conocimientos",
                            widthButton: 260,
                            heightButton: 50,
                            size: bigSize,
                            color: rojoColor,
                            hoverColor: rojoColor,
                            duration: 1000,
                            onTap: () => navigator.push(
                                page: "ejercicio-equivalencia-page"),
                          ),
                          separadorVertical(context, 3),
                        ],
                      ),
                    ))
                  ],
                ))));
  }
}
