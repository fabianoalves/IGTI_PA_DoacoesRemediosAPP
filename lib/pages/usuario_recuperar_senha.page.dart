
import 'package:flutter/material.dart';

class UsuarioRecuperarSenhaPage extends StatefulWidget {
  @override
  _UsuarioRecuperarSenhaPageState createState() => _UsuarioRecuperarSenhaPageState();
}

class _UsuarioRecuperarSenhaPageState extends State<UsuarioRecuperarSenhaPage> {
  final TextEditingController _emailController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Recuperar Senha'),
        ),
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                TextFormField(
                  controller: _emailController,
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(color: Colors.black87, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.black87)),
                ),
                Divider(),

                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () => {
    

                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          // retorna um objeto do tipo Dialog
                          return AlertDialog(
                            title: new Text("Sucesso"),
                            content: new Text("Um e-mail com o procedimento de recuperação de senha foi enviado apara o e-mail informado"),
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

                    },
                    child: Text(
                      "Enviar",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: Colors.green,
                  ),
                ),
              ],
            ),
          ),
        ));
  }
}
