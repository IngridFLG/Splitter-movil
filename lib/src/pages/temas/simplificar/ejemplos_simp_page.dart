import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjemplosSimplificarPage extends StatefulWidget {
  static const name = "ejemplos-simplificar-page";
  const EjemplosSimplificarPage({super.key});

  @override
  State<EjemplosSimplificarPage> createState() =>
      _EjemplosSimplificarPageState();
}

class _EjemplosSimplificarPageState extends State<EjemplosSimplificarPage> {
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
                          child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  texto("Ejemplo", fontBold, 24, rojoColor,
                                      TextAlign.start),
                                  texto(
                                      "Simplifiquemos la fracción 12/18:",
                                      fontApp,
                                      bigSize,
                                      negroColor,
                                      TextAlign.start),
                                  separadorVertical(context, 2),
                                  SizedBox(
                                      width: size.width * 0.9,
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Paso 1: Descomponer en factores primos. ",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: rojoColor,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "Descomponemos el numerador y el denominador en sus factores primos:",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: negroColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Column(
                                        children: [
                                          texto(
                                              "12 = 2 x 2 x 3",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              "18 = 2 x 3 x 3",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center)
                                        ],
                                      )),
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
                                  SizedBox(
                                      width: size.width * 0.9,
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Paso 2: Identificar factores comunes. ",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: rojoColor,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "Observamos qué factores primos comparten el numerador y el denominador:",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: negroColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Column(
                                        children: [
                                          texto(
                                              "Factores comunes: 2 x 3",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                        ],
                                      )),
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
                                  SizedBox(
                                      width: size.width * 0.9,
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Paso 3:  Calcular el MCD. ",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: rojoColor,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "Multiplicamos los factores comunes:",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: negroColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Column(
                                        children: [
                                          texto(
                                              "MCD = 2 x 3 = 6",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                        ],
                                      )),
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
                                  SizedBox(
                                      width: size.width * 0.9,
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Paso 4: Dividir numerador y denominador. ",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: rojoColor,
                                              ),
                                            ),
                                            TextSpan(
                                              text:
                                                  "Dividimos tanto el numerador como el denominador por el MCD:",
                                              style: TextStyle(
                                                fontFamily: fontApp,
                                                fontSize: bigSize,
                                                color: negroColor,
                                              ),
                                            ),
                                          ],
                                        ),
                                      )),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Column(
                                        children: [
                                          texto(
                                              "Numerador simplificado: 12 ÷ 6 = 2",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          texto(
                                              "Numerador simplificado: 18 ÷ 6 = 3",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                        ],
                                      )),
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
                                  SizedBox(
                                      width: size.width * 0.9,
                                      child: RichText(
                                        textAlign: TextAlign.start,
                                        text: TextSpan(
                                          children: [
                                            TextSpan(
                                              text:
                                                  "Paso 5: Escribir la fracción simplificada. ",
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
                                          texto(
                                              "La fracción simplificada es 2/3",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                        ],
                                      )),
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
                                  texto(
                                      "Ahora verifíca tú mismo que esto es cierto.",
                                      fontBold,
                                      bigSize,
                                      rojoColor,
                                      TextAlign.start),
                                  SizedBox(
                                      width: size.width * 0.9,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          SizedBox(
                                            width: size.width * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                texto(
                                                    "Simplificando 8/16",
                                                    fontBold,
                                                    bigSize,
                                                    negroColor,
                                                    TextAlign.start),
                                                texto(
                                                    "MCD = 8",
                                                    fontBold,
                                                    bigSize,
                                                    negroColor,
                                                    TextAlign.start),
                                                texto(
                                                    "Fracción simplificada: 1/2",
                                                    fontBold,
                                                    bigSize,
                                                    negroColor,
                                                    TextAlign.start),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: size.width * 0.4,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                texto(
                                                    "Simplificando 25/45",
                                                    fontBold,
                                                    bigSize,
                                                    negroColor,
                                                    TextAlign.start),
                                                texto(
                                                    "MCD = 5",
                                                    fontBold,
                                                    bigSize,
                                                    negroColor,
                                                    TextAlign.start),
                                                texto(
                                                    "Fracción simplificada: 5/9",
                                                    fontBold,
                                                    bigSize,
                                                    negroColor,
                                                    TextAlign.start),
                                              ],
                                            ),
                                          ),
                                        ],
                                      )),
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
                                  Center(
                                    child: BotonAgregar(
                                      textButton: "Probar conocimientos",
                                      widthButton: 260,
                                      heightButton: 50,
                                      size: bigSize,
                                      color: rojoColor,
                                      hoverColor: rojoColor,
                                      duration: 1000,
                                      onTap: () => navigator.push(
                                          page: "ejercicio-simplificar-page"),
                                    ),
                                  ),
                                  separadorVertical(context, 3),
                                ],
                              )),
                        ),
                      )
                    ]))));
  }
}
