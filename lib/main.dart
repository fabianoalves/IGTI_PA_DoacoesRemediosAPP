import 'package:doacoes_remedios/pages/instituicao.page.dart';
import 'package:doacoes_remedios/pages/instituicao_indicacao.page.dart';
import 'package:doacoes_remedios/pages/instituicao_pesquisa.page.dart';
import 'package:doacoes_remedios/pages/instituicao_pesquisa_resultado.page.dart';
import 'package:doacoes_remedios/pages/map.page.dart';
import 'package:doacoes_remedios/pages/splash.page.dart';
import 'package:doacoes_remedios/pages/usuario.page.dart';
import 'package:doacoes_remedios/pages/usuario_recuperar_senha.page.dart';
import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:doacoes_remedios/pages/usuario_cadastro.page.dart';
import 'package:doacoes_remedios/pages/login.page.dart';
import 'package:doacoes_remedios/style.colors.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Doações de Remedios',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        //hintColor: ThemeColors.PrimaryColor
        
      ),
      //home: SplashPage(),
      routes: {        
        AppRoutes.LOGIN: (_) => LoginPage(),//LoginPage(),
        AppRoutes.USER: (_) => UsuarioPage(),
        AppRoutes.USER_FORM: (_) => UsuarioCadastroPage(),
        AppRoutes.INSTITUICAO: (_) => InstituicaoPage(),
        AppRoutes.INSTITUICAO_PESQUISA: (_) => InstituicaoPesquisaPage(),
        AppRoutes.INSTITUICAO_PESQUISA_RESULT: (_) => InstituicaoPesquisaResultPage(),
        AppRoutes.INSTITUICAO_INDICACAO: (_) => InstituicaoIndicacaoPage(),
        AppRoutes.USER_RECUPERAR_SENHA: (_) => UsuarioRecuperarSenhaPage(),
        AppRoutes.MAPA: (_) => MapPage(),
      },
    );
  }
}
