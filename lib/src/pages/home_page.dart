import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/config/router/home_rutas.dart';
import 'package:splitter_movil_frontend/src/pages/inicio/login_page.dart';

import '../providers/usuario_provider.dart';

class HomePage extends StatefulWidget {
  static const name = 'home-page';

  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final provider = Provider.of<NavigatorProvider>(context);
    Widget widget = getPageByName(provider.tab.page);
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        provider.pop();
      },
      child: Scaffold(
        body: SafeArea(bottom: false, child: widget),
        bottomNavigationBar: Container(
          height: 60,
          decoration: BoxDecoration(boxShadow: [
            BoxShadow(
              color: grisClaColor.withOpacity(0.5),
              spreadRadius: 0,
              blurRadius: 15,
              offset: const Offset(0, 0),
            )
          ]),
          child: CurvedNavigationBar(
            index: provider.tab.index!,
            height: 60.0,
            items: [
              Container(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  'assets/iconos/Book_check.svg',
                  color: provider.tab.index == 0 ? blancoColor : grisClaroColor,
                  height: size.width * 0.07,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  'assets/iconos/Video.svg',
                  color: provider.tab.index == 1 ? blancoColor : grisClaroColor,
                  height: size.width * 0.07,
                ),
              ),
              Container(
                padding: const EdgeInsets.all(2),
                child: SvgPicture.asset(
                  'assets/iconos/Sign_in_squre.svg',
                  color: provider.tab.index == 2 ? blancoColor : grisClaroColor,
                  height: size.width * 0.07,
                ),
              ),
            ],
            color: const Color.fromARGB(255, 65, 65, 65),
            buttonBackgroundColor: rojoColor,
            backgroundColor: Colors.transparent,
            animationCurve: Curves.linear,
            animationDuration: const Duration(milliseconds: 300),
            onTap: (int tappedIndex) {
              if (tappedIndex == 2) {
                Provider.of<NavigatorProvider>(context, listen: false).clear();
                Provider.of<UsuarioProvider>(context, listen: false)
                    .vaciarUsuarioProvider();
                // Navegar a la página de inicio de sesión sin el Navbar
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const LoginPage()),
                );
              } else {
                setState(() {
                  provider.push(
                    index: tappedIndex,
                    page: getNamePageByIndex(tappedIndex),
                  );
                });
              }
            },
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
