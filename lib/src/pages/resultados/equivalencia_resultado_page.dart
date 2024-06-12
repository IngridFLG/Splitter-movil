
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/models/resultado_model.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/providers/services_provider.dart';
import 'package:splitter_movil_frontend/src/providers/usuario_provider.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class EquivalenciaResultadoPage extends StatefulWidget {
  static const name = 'equivalencia-resultado-page';
  const EquivalenciaResultadoPage({super.key});

  @override
  State<EquivalenciaResultadoPage> createState() => _EquivalenciaResultadoPageState();
}

class _EquivalenciaResultadoPageState extends State<EquivalenciaResultadoPage> {
  List<ResultadosModel>? resultados;
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    loadData();
  }

  void loadData() async {
    final usuarioProvider =
        Provider.of<UsuarioProvider>(context, listen: false);

    String token = usuarioProvider.token!;
    int usuarioId = usuarioProvider.usuario!.id;
    int temaId = usuarioProvider.buscarTemaPorNombre("Fracciones equivalentes")!;

    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response =
        await servicePorvider.resultadoService.listarResultados(token, usuarioId, temaId);
    setState(() {
      resultados = response;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final navigator = Provider.of<NavigatorProvider>(context, listen: false);
    final size = MediaQuery.of(context).size;
    return Scaffold(
        floatingActionButton: Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(
              left: size.width * 0.05, bottom: size.height * 0.005),
          child: BotonAgregar(
            textButton: "Volver",
            widthButton: 260,
            heightButton: 50,
            size: bigSize,
            color: rojoColor,
            hoverColor: rojoColor,
            duration: 1000,
            onTap: () async {
              navigator.pop();
            },
          ),
        ),
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
                      Padding(
                          padding: const EdgeInsets.only(left: 20, right: 20),
                          child: Column(children: [
                            separadorVertical(context, 4),
                            texto('Resultados de equivalencia de fracciones', fontApp,
                                18, negroColor, TextAlign.center),
                            separadorVertical(context, 3),
                            isLoading
                                ? const Center(
                                    child: CircularProgressIndicator())
                                : Column(children: [
                                    SizedBox(
                                      height: size.height * 0.55,
                                      child: SingleChildScrollView(
                                        physics: const BouncingScrollPhysics(),
                                        scrollDirection: Axis.vertical,
                                        child: Wrap(
                                          direction: Axis.horizontal,
                                          spacing: 25.0,
                                          children: [
                                            for (int index = 0;
                                                index < resultados!.length;
                                                index++)
                                              Padding(
                                                padding: const EdgeInsets.only(
                                                  bottom: 12.0,
                                                ),
                                                child: _WrapType(
                                                  puntaje: resultados![index].puntaje,
                                                ),
                                              ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ]),
                            separadorVertical(context, 6),
                          ]))
                    ]))));
  }
}

class _WrapType extends StatelessWidget {
  final double puntaje;

  const _WrapType({
    required this.puntaje,
  });

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    String assetPath = "";
    if (puntaje > 75 && puntaje <= 100) {
      assetPath = "assets/imagenes/estrella4.png";
    } else if (puntaje > 50 && puntaje <= 75) {
      assetPath = "assets/imagenes/estrella3.png";
    } else {
      assetPath = "assets/imagenes/estrella2.png";
    }

    return Container(
      width: 150,
      decoration: BoxDecoration(
          color: grisClaColor, borderRadius: BorderRadius.circular(20)),
      child: Column(
        children: [
          Image.asset(
            assetPath,
            fit: BoxFit.fitWidth,
            height: size.height * 0.12,
          ),
          Container(
              decoration: BoxDecoration(
                  color: rojoColor,
                  borderRadius: const BorderRadius.only(
                      bottomRight: Radius.circular(20),
                      bottomLeft: Radius.circular(20))),
              width: 150,
              child: Column(children: [
                texto("Puntaje: $puntaje", fontMedium, bigSize, blancoColor,
                    TextAlign.center),
                texto("Preguntas correctas: ${puntaje ~/ 25}/4", fontMedium,
                    bigSize, blancoColor, TextAlign.center),
              ])),
        ],
      ),
    );
  }
}