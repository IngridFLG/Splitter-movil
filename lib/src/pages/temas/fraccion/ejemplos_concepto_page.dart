import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjemploConceptoPage extends StatefulWidget {
  static const name = "ejemplos-concepto-page";
  const EjemploConceptoPage({super.key});

  @override
  State<EjemploConceptoPage> createState() => _EjemploConceptoPageState();
}

class _EjemploConceptoPageState extends State<EjemploConceptoPage> {
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
                          child: Container(
                              padding: const EdgeInsets.only(left: 20),
                              alignment: Alignment.centerLeft,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  texto("Ejemplo", fontBold, 24, rojoColor,
                                      TextAlign.start),
                                  texto(
                                      "Una tarta dividida en partes iguales",
                                      fontApp,
                                      bigSize,
                                      negroColor,
                                      TextAlign.start),
                                  separadorVertical(context, 2),
                                  SizedBox(
                                      width: size.width * 0.9,
                                      child: texto(
                                          'Paso 1: Imaginemos una tarta completa.',
                                          fontApp,
                                          bigSize,
                                          rojoColor,
                                          TextAlign.center)),
                                  separadorVertical(context, 2),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Image.asset(
                                        "assets/imagenes/paso1.jpeg",
                                        width: 50,
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
                                      child: texto(
                                          'Paso 2: Dividimos la tarta en 4 partes iguales.',
                                          fontApp,
                                          bigSize,
                                          rojoColor,
                                          TextAlign.center)),
                                  separadorVertical(context, 3),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Image.asset(
                                        "assets/imagenes/paso2.jpeg",
                                        width: 50,
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
                                      child: texto(
                                          'Paso 3: Tomamos 1 de esas 4 partes.',
                                          fontApp,
                                          bigSize,
                                          rojoColor,
                                          TextAlign.center)),
                                  separadorVertical(context, 3),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Image.asset(
                                        "assets/imagenes/paso3.jpeg",
                                        width: 50,
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
                                      child: texto(
                                          'Fracción: 1/4',
                                          fontApp,
                                          bigSize,
                                          rojoColor,
                                          TextAlign.center)),
                                  separadorVertical(context, 3),
                                  SizedBox(
                                      width: size.width * 0.8,
                                      child: Column(
                                        children: [
                                          texto(
                                              "Numerador (1): La cantidad de partes que tomamos.",
                                              fontBold,
                                              bigSize,
                                              negroColor,
                                              TextAlign.center),
                                          separadorVertical(context, 2),
                                          texto(
                                              "Denominador (4): La cantidad total de partes en que dividimos la tarta.",
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
                                          page: "ejercicio-concepto-page"),
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
