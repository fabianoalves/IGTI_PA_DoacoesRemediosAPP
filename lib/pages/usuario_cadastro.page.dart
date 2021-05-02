import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:convert';
import 'package:http/http.dart' as http;


import '../style.colors.dart';

Future<Usuario> createUsuario(String nome, String email, String senha) async {
  final http.Response response = await http.post(
    'http://10.0.0.107:5000/api/usuarios', //
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

class Usuario {
  final int id;
  final String nome;
  final String email;
  final String senha;

  Usuario({this.id, this.nome, this.email, this.senha});

  factory Usuario.fromJson(Map<String, dynamic> json) {
    return Usuario(
      id: json['id'],
      nome: json['nome'],
      email: json['email'],
      senha: json['senha'],
    );
  }
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: Text('Novo Cadastro'),
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
                  style: new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Nome",
                      labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                ),
                Divider(),
                TextFormField(
                  controller: _emailController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
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
                  style: new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                ),
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () => {
                      //createUsuario(_nomeController.text, _emailController.text,
                      //    _senhaController.text)

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // retorna um objeto do tipo Dialog
                          return AlertDialog(
                            title: new Text("Sucesso"),
                            content: new Text("Cadastro realizado com sucesso"),
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
                      )

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
                    },
                    child: Text(
                      "Cadastrar",
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
