import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class ConceptoPage extends StatefulWidget {
  static const name = "concepto-page";
  const ConceptoPage({super.key});

  @override
  State<ConceptoPage> createState() => _ConceptoPageState();
}

class _ConceptoPageState extends State<ConceptoPage> {
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
                    TemaWidget('tema1.png', 'Tema 1: Concepto de fracción'),
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
                                        text: "En este  ",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: negroColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "Objeto Virtual de Aprendizaje (OVA), ",
                                        style: TextStyle(
                                          fontFamily: fontApp,
                                          fontSize: bigSize,
                                          color: rojoColor,
                                        ),
                                      ),
                                      TextSpan(
                                        text:
                                            "nos embarcaremos en una emocionante aventura para descubrir los secretos de las fracciones. A lo largo del camino, conoceremos personajes fantásticos, resolveremos enigmas desafiantes y crearemos nuestras propias fracciones deliciosas.",
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
                            texto("¿Qué son las fracciones?", fontApp, bigSize,
                                rojoColor, TextAlign.center),
                            SizedBox(
                                width: size.width * 0.9,
                                child: texto(
                                    "Imaginen una deliciosa tarta de chocolate recién horneada. Si la dividimos en 8 partes iguales, cada una de esas partes sería una fracción de la tarta entera. Las fracciones nos sirven para representar partes de un todo.",
                                    fontApp,
                                    bigSize,
                                    negroColor,
                                    TextAlign.center)),
                            separadorVertical(context, 2),
                            Image.asset(
                              "assets/imagenes/chocolate.png",
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
                            texto("¿Cómo se leen las fracciones?", fontApp,
                                bigSize, rojoColor, TextAlign.center),
                            SizedBox(
                                width: size.width * 0.9,
                                child: texto(
                                    'Para leer una fracción, primero decimos el numerador, luego la palabra "de" y finalmente el denominador. Por ejemplo, 3/8 se lee "tres de ocho".',
                                    fontApp,
                                    bigSize,
                                    negroColor,
                                    TextAlign.center)),
                            separadorVertical(context, 3),
                            Divider(
                              color: rojoColor, // Color de la línea
                              thickness: 1, // Grosor de la línea
                              indent: 2, // Espaciado desde el borde izquierdo
                              endIndent: 2, // Espaciado desde el borde derecho
                            ),
                            separadorVertical(context, 3),
                            BotonAgregar(
                              textButton: "Veamos un ejemplo",
                              widthButton: 260,
                              heightButton: 50,
                              size: bigSize,
                              color: rojoColor,
                              hoverColor: rojoColor,
                              duration: 1000,
                              onTap: () => navigator.push(
                                  page: "ejemplos-concepto-page"),
                            ),
                            separadorVertical(context, 3),
                          ],
                        ),
                      ),
                    )
                  ],
                ))));
  }
}
