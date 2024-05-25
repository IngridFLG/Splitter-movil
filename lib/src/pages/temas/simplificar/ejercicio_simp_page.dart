import 'package:flutter/material.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EjercicioSimplificarPage extends StatefulWidget {
  static const name = "ejercicio-simplificar-page";
  const EjercicioSimplificarPage({super.key});

  @override
  State<EjercicioSimplificarPage> createState() => _EjercicioSimplificarPageState();
}

class _EjercicioSimplificarPageState extends State<EjercicioSimplificarPage> {
  @override
  Widget build(BuildContext context) {
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
                    separadorVertical(context, 1),
                  ],
                ))));
  }
}