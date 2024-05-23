import 'package:flutter_deep_linking/flutter_deep_linking.dart';
import 'package:splitter_movil_frontend/src/pages/home.dart';
import 'package:splitter_movil_frontend/src/pages/inicio/login_page.dart';

final router = Router(
  routes: [
    Route(
      routes: [
        Route(
          matcher: Matcher.path(LoginPage.name),
          materialBuilder: (_, __) => const LoginPage(),
        ),
        Route(
          matcher: Matcher.path(Home.name),
          materialBuilder: (_, __) => const Home(),
        ),
      ],
    ),
  ],
);
