import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:doacoes_remedios/pages/cadastro_usuario.page.dart';
import 'package:doacoes_remedios/pages/login.page.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doações de Remedios',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        AppRoutes.HOME: (_) => LoginPage(),
        AppRoutes.USER_FORM: (_) => CadastroUsuarioPage(),
      },
    );
  }
}
