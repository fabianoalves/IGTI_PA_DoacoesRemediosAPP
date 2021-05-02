import 'package:flutter/material.dart';

import '../style.colors.dart';




class InstituicaoIndicacaoPage extends StatefulWidget {
  @override
  _InstituicaoIndicacaoPageState createState() => _InstituicaoIndicacaoPageState();
}

class _InstituicaoIndicacaoPageState extends State<InstituicaoIndicacaoPage> {
  final TextEditingController _nomeController = TextEditingController();
  final TextEditingController _endController = TextEditingController();
  final TextEditingController _telController = TextEditingController();
  final TextEditingController _cepController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text('Indicação de Instituição'),
          backgroundColor: ThemeColors.AppBarColor,
        ),
        body: SingleChildScrollView(child:
          Padding(
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
                    controller: _telController,                  
                    keyboardType: TextInputType.text,
                    style: new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                  ),
                  Divider(),
                  TextFormField(
                    controller: _cepController,
                  
                    keyboardType: TextInputType.text,
                    style: new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "CEP",
                        labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                  ),
                  Divider(),
                  TextFormField(
                    controller: _endController,                  
                    keyboardType: TextInputType.text,
                    style: new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Endereço",
                        labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
                  ),                
                  Divider(),
                  ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () => {
                        //createUsuario(_nomeController.text, _endController.text,
                        //    _cepController.text)

                        showDialog(
                          context: context,
                          builder: (BuildContext context) {
                            // retorna um objeto do tipo Dialog
                            return AlertDialog(
                              title: new Text("Dados enviados com Sucesso"),
                              content: new Text("Agradecemos pela colaboração"),
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
                        "Enviar",
                        style: TextStyle(color: Colors.white),
                      ),
                      color: ThemeColors.PrimaryColor,
                    ),
                  ),
                ],
              ),
            ),
          ),
      )
    );
  }
}
