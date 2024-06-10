import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class ResultadosPage extends StatefulWidget {
  static const name = 'resultados-page';
  const ResultadosPage({super.key});

  @override
  State<ResultadosPage> createState() => _ResultadosPageState();
}

class _ResultadosPageState extends State<ResultadosPage> {
  final List<Map<String, String>> temas = [
    {
      "nombre": "Concepto de fracción",
      "ruta": "conceto-resultado-page",
      "imagen": "tema1.png"
    },
    {
      "nombre": "Simplificar fracciones",
      "ruta": "simplificar-resultado-page",
      "imagen": "tema2.png"
    },
    {
      "nombre": "Fracciones equivalentes",
      "ruta": "equivalencia-resultado-page",
      "imagen": "tema3.png"
    },
    {
      "nombre": "Sumar y restar fracciones",
      "ruta": "sumar-resultado-page",
      "imagen": "tema4.png"
    },
    {
      "nombre": "Multiplicar y dividir fracciones",
      "ruta": "multi-resultado-page",
      "imagen": "tema5.png"
    },
  ];

  @override
  Widget build(BuildContext context) {
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
                      Expanded(
                        child: SingleChildScrollView(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 20, right: 20),
                            child: Column(
                              children: [
                                separadorVertical(context, 4),
                                texto('¡Aquí podras revisar tus resultados!',
                                    fontApp, 18, negroColor, TextAlign.center),
                                texto(
                                    'Selecciona el tema para ver tus calificaciones',
                                    fontApp,
                                    14,
                                    negroColor,
                                    TextAlign.center),
                                separadorVertical(context, 2),
                                Row( 
                                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                                  children: [
                                  Column( children: [
                                    Image.asset('assets/imagenes/estrella2.png', height: 100),
                                    texto("0 - 50", fontApp, 16, negroColor, TextAlign.center),
                                  ]),
                                  Column( children: [
                                    Image.asset('assets/imagenes/estrella3.png', height: 100),
                                    texto("51 - 75", fontApp, 16, negroColor, TextAlign.center),
                                  ]),
                                  Column( children: [
                                    Image.asset('assets/imagenes/estrella4.png', height: 100),
                                    texto("76 - 100", fontApp, 16, negroColor, TextAlign.center),
                                  ])
                                ]),
                                separadorVertical(context, 4),
                                ...temas.map((tema) => Column(
                                      children: [
                                        InkWell(
                                          onTap: () {
                                            navigator.push(page: tema['ruta']!);
                                          },
                                          child: TemaWidget(
                                            tema['imagen']!,
                                            tema['nombre']!,
                                          ),
                                        ),
                                        separadorVertical(context, 4),
                                      ],
                                    )),
                              ],
                            ),
                          ),
                        ),
                      )
                    ]))));
  }
}
