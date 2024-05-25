import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class SimplificarPage extends StatefulWidget {
  static const name = "simplificar-page";
  const SimplificarPage({super.key});

  @override
  State<SimplificarPage> createState() => _SimplificarPageState();
}

class _SimplificarPageState extends State<SimplificarPage> {
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
                    TemaWidget('tema2.png', 'Tema 2: Simplificar fracciones'),
                    separadorVertical(context, 2),
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
                                            "En esta aventura, aprenderemos a ",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: negroColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "simplificar fracciones",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: rojoColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            ", un proceso mágico que nos permite encontrar la forma más sencilla de representar una parte de un todo.",
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
                            texto("¿Qué significa simplificar una fracción?",
                                fontApp, bigSize, rojoColor, TextAlign.center),
                            SizedBox(
                                width: size.width * 0.9,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Simplificar una fracción es como encontrar el tesoro escondido dentro de un cofre. Al simplificar, buscamos ",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: negroColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "la forma más pequeña ",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: rojoColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "posible de escribir la misma fracción, sin cambiar su valor.",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: negroColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                )),
                            separadorVertical(context, 2),
                            Image.asset(
                              "assets/imagenes/simplificar.jpg",
                              width: 200,
                            ),
                            separadorVertical(context, 3),
                            Divider(
                              color: rojoColor, // Color de la línea
                              thickness: 1, // Grosor de la línea
                              indent: 2, // Espaciado desde el borde izquierdo
                              endIndent: 2, // Espaciado desde el borde derecho
                            ),
                            separadorVertical(context, 3),
                            texto("¿Cómo simplificar fracciones?", fontApp,
                                bigSize, rojoColor, TextAlign.center),
                            SizedBox(
                                width: size.width * 0.9,
                                child: RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text:
                                            "Para simplificar una fracción, debemos encontrar el ",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: negroColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "Máximo Común Divisor (MCD) ",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: rojoColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "del numerador y el denominador. El MCD es el número más grande que divide exactamente tanto al numerador como al denominador.",
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
                            BotonAgregar(textButton: "Veamos un ejemplo", widthButton: 260, heightButton: 50, size: bigSize, color: rojoColor, hoverColor: rojoColor, duration: 1000,
                            onTap: () => navigator.push(page: "ejemplos-simplificar-page"),),
                            separadorVertical(context, 3),
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }

}
