import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:splitter_movil_frontend/src/config/environment/environment.dart';
import 'package:splitter_movil_frontend/src/providers/navigator_provider.dart';
import 'package:splitter_movil_frontend/src/routes/home_rutas.dart';

class Home extends StatefulWidget {
  static const name = 'home-page';

  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
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
                  color: provider.tab.index == 3 ? blancoColor : grisClaroColor,
                  height: size.width * 0.07,
                ),
              ),
            ],
            color: blancoColor,
            buttonBackgroundColor: rojoColor,
            backgroundColor: Color.fromARGB(255, 65, 65, 65),
            animationCurve: Curves.bounceIn,
            animationDuration: const Duration(milliseconds: 600),
            onTap: (int tappedIndex) {
              setState(() {
                provider.push(
                    index: tappedIndex, page: getNamePageByIndex(tappedIndex));
              });
            },
            letIndexChange: (index) => true,
          ),
        ),
      ),
    );
  }
}
