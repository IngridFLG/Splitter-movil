import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class MultiplicarPage extends StatefulWidget {
  static const name = "multiplicar-page";
  const MultiplicarPage({super.key});

  @override
  State<MultiplicarPage> createState() => _MultiplicarPageState();
}

class _MultiplicarPageState extends State<MultiplicarPage> {
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
                    TemaWidget('tema5.png',
                        'Tema 5: Multiplicar y Dividir Fracciones'),
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
                                    text: "\nEn esta unidad, aprenderemos a ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Multiplicar y Dividir fracciones, ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "un proceso sencillo de realizar estas operaciones.",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
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
                                    text: "Multiplicación de fracciones\n\n",
                                    style: TextStyle(
                                      fontFamily: fontBold,
                                      fontSize: bigSize + 4,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Para multiplicar fracciones, simplemente multiplicamos los ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "numeradores ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "entre sí y los ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "denominadores ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "entre sí. \nPor ejemplo:\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "2/3 * 3/4 = (2 * 3) / (3 * 4) = 6/12 = 1/2\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Como vimos en el ejemplo anterior, después de realizar la multiplicación, si la fracción resultante se puede simplificar, debemos hacerlo.\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/imagenes/multiplicacion_fracciones.png",
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
                                    text: "División de fracciones\n\n",
                                    style: TextStyle(
                                      fontFamily: fontBold,
                                      fontSize: bigSize + 4,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Mediante el recíproco\n",
                                    style: TextStyle(
                                      fontFamily: fontBold,
                                      fontSize: bigSize + 2,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Para dividir fracciones, multiplicamos la primera fracción por el ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "recíproco ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "de la segunda fracción. El ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "recíproco ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "de una fracción se obtiene intercambiando su numerador y su denominador. \nPor ejemplo:\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "2/3 ÷ 3/4\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "1. Encontramos el recíproco de 3/4, que es 4/3.\n2. Multiplicamos 2/3 por 4/3:\n   2/3 * 4/3 = (2 * 4) / (3 * 3) = 8/9\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Como vimos en el ejemplo anterior, después de realizar la división, si la fracción resultante se puede simplificar, debemos hacerlo.\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Ahora otro metodo para resolver una división de fracciones.\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Mediante productos cruzados\n",
                                    style: TextStyle(
                                      fontFamily: fontBold,
                                      fontSize: bigSize + 2,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Para dividir fracciones, podemos usar el método de productos cruzados. Este método implica multiplicar el numerador de la primera fracción por el denominador de la segunda fracción, y luego multiplicar el denominador de la primera fracción por el numerador de la segunda fracción. ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Por ejemplo:\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "2/3 ÷ 3/4\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "1. Multiplicamos el numerador de la primera fracción y el denominador de la segunda, para asi obtener el numerador de la fracción resultante (2 * 4) = 8.\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "2. Multiplicamos el denominador de la primera fracción y el numerador de la segunda, para asi obtener el denominador de la fracción resultante (3 * 3) = 9.\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "\nSu resultado seria = 8/9\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Ejemplo de los 2 metodos para la división de fracciones:\n",
                                    style: TextStyle(
                                      fontFamily: fontMedium,
                                      fontSize: bigSize,
                                      color: grisColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Image.asset(
                            "assets/imagenes/divisiones_fracciones.png",
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
                                        "Ahora, resuelve tú mismo las siguientes multiplicaciones y divisiones de fracciones.",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(
                            width: size.width * 0.8,
                            child: Column(
                              children: [
                                separadorVertical(context, 1),
                                texto("2/3 * 3/5", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                texto("3/4 * 1/2", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                texto("5/6 * 2/3", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                texto("2/5 ÷ 1/3", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                texto("4/8 ÷ 2/5", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                                texto("7/2 ÷ 3/5", fontBold, bigSize,
                                    negroColor, TextAlign.center),
                              ],
                            ),
                          ),
                          separadorVertical(context, 2),
                          Divider(
                            color: rojoColor, // Color de la línea
                            thickness: 1, // Grosor de la línea
                            indent: 2, // Espaciado desde el borde izquierdo
                            endIndent: 2, // Espaciado desde el borde derecho
                          ),
                          separadorVertical(context, 2.5),
                          BotonAgregar(
                            textButton: "Probar conocimientos",
                            widthButton: 260,
                            heightButton: 60,
                            size: bigSize,
                            color: rojoColor,
                            hoverColor: rojoColor,
                            duration: 1000,
                            onTap: () => navigator.push(
                                page: "ejercicio-multi-dividir-page"),
                          ),
                          separadorVertical(context, 3),
                        ],
                      ),
                    ))
                  ],
                ))));
  }
}
