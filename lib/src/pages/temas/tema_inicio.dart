import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class TemaInicio extends StatefulWidget {
  static const name = 'tema-inicio-page';
  const TemaInicio({super.key});

  @override
  State<TemaInicio> createState() => _TemaInicioState();
}

class _TemaInicioState extends State<TemaInicio> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
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
                        separadorVertical(context, 5),
                        texto('¡Vamos a aprender y divertirnos!', fontApp, 18,
                            negroColor, TextAlign.center),
                        separadorVertical(context, 5),
                        InkWell(
                            onTap: () {},
                            child: TemaWidget(
                                'tema1.png', 'Tema 1: Concepto de fracción')),
                        separadorVertical(context, 5),
                        InkWell(
                          onTap: () {},
                          child: TemaWidget(
                              'tema2.png', 'Tema 2: Simplificar fracciones'),
                        ),
                        separadorVertical(context, 5),
                        InkWell(
                          onTap: () {},
                          child: TemaWidget(
                              'tema3.png', 'Tema 3: Fracciones equivalentes'),
                        ),
                        separadorVertical(context, 5),
                        InkWell(
                          onTap: () {},
                          child: TemaWidget(
                              'tema4.png', 'Tema 4: Sumar y restar fracciones'),
                        ),
                        separadorVertical(context, 5),
                        InkWell(
                          onTap: () {},
                          child: TemaWidget('tema5.png',
                              'Tema 5: Multiplicar y dividir fracciones'),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  Row TemaWidget(String imagen, String tema) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          decoration: const BoxDecoration(
            color: Color.fromARGB(255, 65, 65, 65),
            borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(10), topLeft: Radius.circular(10)),
          ),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Image.asset(
              'assets/imagenes/$imagen',
              height: 100,
              width: 130,
            ),
          ),
        ),
        Container(
          decoration: BoxDecoration(
              color: rojoColor,
              borderRadius: const BorderRadius.only(
                  bottomRight: Radius.circular(10),
                  topRight: Radius.circular(10))),
          child: Container(
            padding: const EdgeInsets.all(10),
            width: 150,
            height: 120,
            child: texto(tema, fontApp, 17, blancoColor, TextAlign.center),
          ),
        )
      ],
    );
  }
}
