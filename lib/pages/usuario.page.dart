import 'dart:convert';

import 'package:doacoes_remedios/components/custom_bottom_navigation_bar.dart';
import 'package:doacoes_remedios/models/usuario.model.dart';
import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../config.dart';
import '../style.colors.dart';

Future<Usuario> obterUsuario() async {
  String reqText = Config.APIEndpoint + '/usuarios/4';

  debugPrint("GET " + reqText);
  final http.Response response = await http.get(Uri.parse(reqText));
  // debugPrint(response.statusCode.toString() +
  //     " - " +
  //     response.reasonPhrase +
  //     " - " +
  //     response.body);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    Usuario usuario = Usuario.fromJson(data);
    //debugPrint("tudo ok " + instituicoes.length.toString());
    return usuario;
  } else {
    debugPrint(response.statusCode.toString() + " - " + response.reasonPhrase);
    throw Exception('Ocorreu um erro ao obter usuario');
  }
}

//class UsuarioPage extends StatelessWidget {
//const UsuarioPage({Key key}) : super(key: key);
class UsuarioPage extends StatefulWidget {
  @override
  _UsuarioPageState createState() => _UsuarioPageState();

  // obterUsuario().then((value) {
  //   setState(() {
  //     usuario = value;
  //   });
  // });
}

class _UsuarioPageState extends State<UsuarioPage> {
  Usuario usuario = new Usuario(
    id: 1,
    email: 'f@f.com',
    nome: 'Fabiano Alves',
    senha: "123",
  );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 213, 217, 1),
      appBar: AppBar(
        title: Text('Perfil'),
        automaticallyImplyLeading: false,
        backgroundColor: ThemeColors.AppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(children: [
          Row(
            children: [
              Container(
                width: 100,
                height: 100,
                padding: const EdgeInsets.all(8),
                color: ThemeColors.WhiteColor,
                child: Center(
                    child: Text(
                  "FA",
                  style: TextStyle(fontSize: 20),
                )),
              ),
              Container(
                padding: const EdgeInsets.all(20),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        usuario.nome,
                        style: TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        usuario.email,
                        style: TextStyle(fontSize: 17),
                      ),
                    ]),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FlatButton(
                  onPressed: () {
                    //Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                    Navigator.of(context).pushNamed(
                      AppRoutes.USER_FORM,
                      arguments: {'usuario': usuario},
                    );
                  },
                  child: Text(
                    "Editar",
                    style: TextStyle(
                        fontSize: 18,
                        color: ThemeColors.PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                FlatButton(
                  onPressed: () {
                    Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                  },
                  child: Text(
                    "Sair",
                    style: TextStyle(
                        fontSize: 18,
                        color: ThemeColors.PrimaryColor,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            ),
          ),
        ]),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}
