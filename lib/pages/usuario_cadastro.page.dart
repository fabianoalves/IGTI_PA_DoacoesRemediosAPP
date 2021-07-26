//import 'dart:js_util';

import 'package:doacoes_remedios/models/usuario.model.dart';
import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../style.colors.dart';
import '../config.dart';

Future<Usuario> createUsuario(String nome, String email, String senha) async {
  final http.Response response = await http.post(
    Uri.parse(Config.APIEndpoint + '/usuarios'), //
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, String>{
      'nome': nome,
      'email': email,
      'senha': senha,
    }),
  );

  if (response.statusCode == 201) {
    return Usuario.fromJson(jsonDecode(response.body));
  } else {
    throw Exception('Failed to create user.');
  }
}

void salvarUsuario(
    BuildContext context, String nome, String email, String senha) async {
  try {
    var usuario = await createUsuario(nome, email, senha);
    if (usuario == null)
      throw new Exception("Ocorreu um erro ao salvar registro");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Sucesso"),
          content: new Text("Dados salvos com sucesso"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  } catch (e) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        // retorna um objeto do tipo Dialog
        return AlertDialog(
          title: new Text("Erro ao gravar dados"),
          content: new Text("Ocorreu um erro ao gravar os dados"),
          actions: <Widget>[
            // define os botões na base do dialogo
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  /*showDialog(
    context: context,
    builder: (BuildContext context) {
      // retorna um objeto do tipo Dialog
      return AlertDialog(
        title: new Text("Dados inválidos"),
        content: new Text(
            "Seu e-mail ja encontra-se cadastrado"),
        actions: <Widget>[
          // define os botões na base do dialogo
          new FlatButton(
            child: new Text("Fechar"),
            onPressed: () {
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  )*/
}

class UsuarioCadastroPage extends StatefulWidget {
  @override
  _UsuarioCadastroPageState createState() => _UsuarioCadastroPageState();
}

class _UsuarioCadastroPageState extends State<UsuarioCadastroPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _senhaController = TextEditingController();
  //Future<Usuario> _futureAlbum;
  Usuario usuario = new Usuario();

  @override
  Widget build(BuildContext context) {
    String pageTitle = "Novo Cadastro";
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    if (arguments != null && arguments.keys.contains("usuario")) {
      usuario = arguments["usuario"];
      pageTitle = "Editar Cadastro";
      _nomeController.text = usuario.nome;
      _emailController.text = usuario.email;
      _senhaController.text = usuario.senha;
    }

    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text(pageTitle),
          backgroundColor: ThemeColors.AppBarColor,
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                TextFormField(
                  controller: _nomeController,
                  autofocus: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                      color: ThemeColors.BlackColor, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                ),
                Divider(),
                TextFormField(
                  controller: _emailController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(
                      color: ThemeColors.BlackColor, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                ),
                Divider(),
                TextFormField(
                  controller: _senhaController,
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(
                      color: ThemeColors.BlackColor, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                ),
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () => salvarUsuario(
                        context,
                        _nomeController.text,
                        _emailController.text,
                        _senhaController.text),
                    child: Text(
                      "Salvar",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: ThemeColors.PrimaryColor,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
