import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class SumarPage extends StatefulWidget {
  static const name = "sumar-page";
  const SumarPage({super.key});

  @override
  State<SumarPage> createState() => _SumarPageState();
}

class _SumarPageState extends State<SumarPage> {
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
                    TemaWidget(
                        'tema4.png', 'Tema 4: Suma y Resta de Fracciones'),
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
                                      text: "Sumar y Restar fracciones, ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: rojoColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "existen 2 tipos: Igual denominador y diferente denominador. De comienzo aprenderemos el primer tipo.",
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
                                            "Suma y Resta de fracciones con igual denominador\n\n",
                                        style: TextStyle(
                                          fontFamily: fontBold,
                                          fontSize: bigSize + 4,
                                          color: rojoColor,
                                        )),
                                    TextSpan(
                                      text:
                                          "Para sumar o restar estas fracciones, es necesario que tengan el mismo denominador. Si las fracciones tienen el mismo denominador, simplemente ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "sumamos o restamos los numeradores y mantenemos el denominador igual. ",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: rojoColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Siempre haciendo la operación que nos indique el signo, \nPor ejemplo:\n\n",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "2/5 + 1/5 = (2 + 1) / 5 = 3/5 \n 3/4 - 1/4 = (3 - 1) / 4 = 2/4 ó 1/2\n\n",
                                      style: TextStyle(
                                        fontFamily: fontApp,
                                        fontSize: bigSize,
                                        color: negroColor,
                                      ),
                                    ),
                                    TextSpan(
                                      text:
                                          "Como vimos en el ejemplo anterior, después de realizar la resta, si la fracción resultante se puede simplificar, debemos hacerlo.\n",
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
                            "assets/imagenes/suma_igual_denominador.png",
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
                                        "Suma y Resta de fracciones con diferente denominador\n\n",
                                    style: TextStyle(
                                      fontFamily: fontBold,
                                      fontSize: bigSize + 4,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Para sumar o restar fracciones con diferente denominador, primero debemos encontrar un ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "denominador común. ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "El denominador común más fácil de usar es el ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "mínimo común múltiplo (mcm) ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
								  WidgetSpan(
                                    child: GestureDetector(
                                        onTap: () {
                                            showDialog(
                                                context: context,
                                                builder: (context) =>
                                                    AlertaVolver(
                                                      width: 320,
                                                      height: 270,
                                                      function: () {
                                                        Navigator.of(context)
                                                            .pop();
                                                      },
                                                      widthButton: 30,
                                                      textoBoton: 'Volver',
                                                      image: Image.asset(
                                                          'assets/imagenes/warning.jpg',
                                                          height: 0),
                                                      mensaje:
                                                          "El MCM es el número más pequeño que puede ser dividido   exactamente por cada uno de los números dados sin dejar residuo.",
                                                      dobleBoton: false,
                                                    ),
                                                  );
                                                },
                                                child: Icon(
                                                  Icons.help_outline,
                                                  color: rojoColor,
                                                  size: 24.0,
                                                ),
                                              ),
                                            ),
                                  TextSpan(
                                    text: "de los denominadores. Luego, ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "convertimos cada fracción ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "para que tengan el mismo denominador común. \nPor ejemplo:\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "1/4 + 1/6\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "1. Encontramos el ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "mcm ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "de 4 y 6, que es 12.\n2. ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Convertimos ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "cada fracción a su equivalente con denominador 12:\n   1/4 = 3/12\n   1/6 = 2/12\n3. ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "Sumamos ",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "los numeradores y mantenemos el denominador:\n   3/12 + 2/12 = (3 + 2) / 12 = 5/12\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "El mismo proceso se aplica para la resta:\n\n",
                                    style: TextStyle(
                                      fontFamily: fontMedium,
                                      fontSize: bigSize + 2,
                                      color: rojoColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text: "5/8 - 1/3\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "1. Encontramos el mcm de 8 y 3, que es 24.\n2. Convertimos cada fracción a su equivalente con denominador 24:\n   5/8 = 15/24\n   1/3 = 8/24\n3. Restamos los numeradores y mantenemos el denominador:\n   15/24 - 8/24 = (15 - 8) / 24 = 7/24\n\n",
                                    style: TextStyle(
                                      fontFamily: fontApp,
                                      fontSize: bigSize,
                                      color: negroColor,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        "Después de realizar la operación, si la fracción resultante se puede simplificar, debemos hacerlo.\nAqui otro ejemplo:\n",
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
                            "assets/imagenes/suma_fracciones.png",
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
                                          "Ahora, resuelve tú mismo las siguientes sumas y restas de fracciones.",
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
                                  separadorVertical(context, 1),
                                  texto("7/2 + 3/5", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("3/6 + 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("5/10 + 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("2/5 - 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("4/8 - 1/2", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                  texto("7/2 + 3/5", fontBold, bigSize,
                                      negroColor, TextAlign.center),
                                ],
                              )),
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
                                page: "ejercicio-suma-resta-page"),
                          ),
                          separadorVertical(context, 3),
                        ],
                      ),
                    ))
                  ],
                ))));
  }
}