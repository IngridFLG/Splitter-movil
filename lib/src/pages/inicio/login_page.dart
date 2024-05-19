import 'package:animate_do/animate_do.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/helpers/helperts.dart';
import 'package:splitter_movil_frontend/src/widgets/widgets.dart';

class LoginPage extends StatefulWidget {
  static const name = 'login-page';
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _controllerCorreo = TextEditingController();
  final TextEditingController _controllerContrasena = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    _controllerCorreo.dispose();
    _controllerContrasena.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
        body: SingleChildScrollView(
            child: Container(
                color: Color.fromARGB(255, 255, 255, 255),
                height: size.height,
                width: size.width,
                child: Stack(children: [
                  //*fondo
                  Positioned(
                      child: Center(
                          child: Image.asset(
                    'assets/imagenes/foto-colegio.png',
                    height: size.height,
                    width: size.width,
                    fit: BoxFit.cover,
                  ))),

                  //*cuerpo pagina
                  Positioned(
                      left: size.height * 2.5 / 100,
                      top: size.height * 35 / 100,
                      child: Container(
                        decoration: BoxDecoration(
                            color: blancoColor,
                            borderRadius: BorderRadius.circular(10)),
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                separadorVertical(context, 3),
                                texto('¡Bienvenido a Splitter!', fontBold, 25,
                                    negroColor, TextAlign.center),
                                separadorVertical(context, 2),
                                Form(
                                    key: _formKey,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        CustomTextFormField(
                                          hintColor: negroColor,
                                          textColor: negroColor,
                                          borderColor: negroColor,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) =>
                                              isRequired(value),
                                          width: size.width * 80 / 100,
                                          height: size.height * 9 / 100,
                                          hint: "Usuario",
                                          controller: _controllerCorreo,
                                          errorColor: amarilloClaroColor,
                                        ),
                                        separadorVertical(context, 1),
                                        PasswordTextFormField(
                                          borderColor: negroColor,
                                          hintColor: negroColor,
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          validator: (value) =>
                                              isRequired(value),
                                          width: size.width * 80 / 100,
                                          height: size.height * 9 / 100,
                                          hint: "Contraseña",
                                          controller: _controllerContrasena,
                                          errorColor: amarilloClaroColor,
                                        ),
                                        separadorVertical(context, 1),
                                      ],
                                    )),
                                separadorVertical(context, 8),
                                BotonAgregar(
                                  onTap: () => login(),
                                  color: rojoColor,
                                  hoverColor: rojoColor,
                                  size: bigSize,
                                  textButton: 'Iniciar Sesión',
                                  heightButton: size.height * 6 / 100,
                                  widthButton: size.width * 40 / 100,
                                  duration: 1000,
                                ),
                                separadorVertical(context, 5),
                              ]),
                        ),
                      ))
                ]))));
  }

  void login() async {
    // final servicePorvider =
    //     Provider.of<ServicesProvider>(context, listen: false);
    // if (!_formKey.currentState!.validate()) {
    //   return;
    // }
    // LoginModel loginRequest = LoginModel(
    //   correo: _controllerCorreo.text,
    //   contrasena: _controllerContrasena.text,
    // );

    // final response = await servicePorvider.authService.login(loginRequest);

    // if (response['type'].toString().toLowerCase() == 'success') {
    //   // ignore: use_build_context_synchronously
    //   final provider = Provider.of<DatosGlobalesProvider>(context, listen: false);
    //   // ignore: use_build_context_synchronously
    //   final usuarioProvider = Provider.of<UsuarioProvider>(context, listen: false);
    //   usuarioProvider.setToken(response['msg']['token']);
    //   provider.data.addAll({
    //     'token': response['msg']['token'],
    //     'vigilanteId': response['msg']['usuarioid'],
    //     'residenciaId': response['msg']['residenciaid'],
    //   });

    //   // ignore: use_build_context_synchronously
    //   Navigator.pushNamed(context, "home-page");
    // } else {
    //   showDialog(
    //       // ignore: use_build_context_synchronously
    //       context: context,
    //       builder: (context) => AlertaVolver(
    //             width: 300,
    //             height: 250,
    //             function: () {
    //               Navigator.of(context).pop();
    //             },
    //             widthButton: 50,
    //             textoBoton: 'Volver',
    //             image: Image.asset(
    //               'assets/imagenes/nuvi-alert.png',
    //               height: 100,
    //             ),
    //             mensaje: response['msg'],
    //           ));
    // }
    // return;
  }
}
