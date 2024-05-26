import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/helpers/helperts.dart';
import 'package:splitter_movil_frontend/src/models/usuario_model.dart';
import 'package:splitter_movil_frontend/src/providers/services_provider.dart';
import 'package:splitter_movil_frontend/src/providers/usuario_provider.dart';
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
                color: const Color.fromARGB(255, 255, 255, 255),
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
    LoginModel loginRequest = LoginModel(
        contrasena: _controllerContrasena.text, correo: _controllerCorreo.text);
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response = await servicePorvider.usuarioService.login(loginRequest);
    if (response.type == 'success') {
      // ignore: use_build_context_synchronously
      // obtenerInfoUsuario(_controllerCorreo.value.text, response.msg!, context);

      // ignore: use_build_context_synchronously
      obtenerTemas(response.msg!, context);
      // ignore: use_build_context_synchronously
      Navigator.pushNamed(context, "home-page");
    } else {
      // ignore: use_build_context_synchronously
      showDialog(
        // ignore: use_build_context_synchronously
        context: context,
        builder: (context) => AlertaVolver(
          width: 250,
          height: 200,
          function: () {
            Navigator.of(context).pop();
          },
          widthButton: 40,
          textoBoton: 'Volver',
          image: Image.asset('assets/imagenes/warning.jpg', height: 80),
          mensaje: response.msg,
          dobleBoton: false,
        ),
      );
    }
  }

  Future<void> obtenerInfoUsuario(
      String correo, String token, BuildContext context) async {
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response =
        await servicePorvider.usuarioService.detalleUsuario(correo, token);

    
    final usuarioProvider =
    // ignore: use_build_context_synchronously
        Provider.of<UsuarioProvider>(context, listen: false);
    usuarioProvider.setToken(token);
    usuarioProvider.setUsuario(response);
  }

  Future<void> obtenerTemas( String token, BuildContext context) async {
    final servicePorvider =
        Provider.of<ServicesProvider>(context, listen: false);
    final response =
        await servicePorvider.temaService.listarTemas(token);

    final usuarioProvider =
    // ignore: use_build_context_synchronously
        Provider.of<UsuarioProvider>(context, listen: false);
    usuarioProvider.setTemas(response);
  }
}
