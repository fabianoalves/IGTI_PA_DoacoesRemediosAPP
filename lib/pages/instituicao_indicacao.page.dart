import 'dart:convert';
import 'package:doacoes_remedios/models/instituicao.model.dart';
import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import '../config.dart';
import '../style.colors.dart';

Future<Instituicao> enviarDados(
    String nome, String endereco, String cep, String telefone) async {
  final http.Response response = await http.post(
    Uri.parse(Config.APIEndpoint + '/instituicoes'), //
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
    },
    body: jsonEncode(<String, Object>{
      'nome': nome,
      'endereco': endereco,
      'cep': cep,
      'telefone': telefone,
      'status': InstituicaoStatus.PENDENTE,
    }),
  );
  debugPrint(response.statusCode.toString() +
      " - " +
      response.reasonPhrase +
      " - " +
      response.body);
  if (response.statusCode == 201) {
    return Instituicao.fromJson(jsonDecode(response.body));
  } else {
    debugPrint(response.statusCode.toString() + " - " + response.reasonPhrase);
    throw Exception('Ocorreu um erro ao salvar o registro');
  }
}

void indicarInstituicao(BuildContext context, String nome, String endereco,
    String cep, String telefone) async {
  try {
    var cad = await enviarDados(nome, endereco, cep, telefone);
    if (cad == null) throw new Exception("Ocorreu um erro ao salvar registro");
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Sucesso"),
          content: new Text("Dados salvos com sucesso"),
          actions: <Widget>[
            new FlatButton(
              child: new Text("Fechar"),
              onPressed: () {
                Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO);
              },
            ),
          ],
        );
      },
    );
  } catch (e) {
    debugPrint("ERROR: " + e.toString());
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: new Text("Erro ao gravar dados"),
          content: new Text("Ocorreu um erro ao gravar os dados: "),
          actions: <Widget>[
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
}

class InstituicaoIndicacaoPage extends StatefulWidget {
  @override
  _InstituicaoIndicacaoPageState createState() =>
      _InstituicaoIndicacaoPageState();
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
        body: SingleChildScrollView(
          child: Padding(
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
                        labelStyle:
                            TextStyle(color: ThemeColors.LabelInputForm)),
                  ),
                  Divider(),
                  TextFormField(
                    controller: _telController,
                    keyboardType: TextInputType.phone,
                    style: new TextStyle(
                        color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Telefone",
                        labelStyle:
                            TextStyle(color: ThemeColors.LabelInputForm)),
                  ),
                  Divider(),
                  TextFormField(
                    controller: _cepController,
                    keyboardType: TextInputType.number,
                    style: new TextStyle(
                        color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "CEP",
                        labelStyle:
                            TextStyle(color: ThemeColors.LabelInputForm)),
                  ),
                  Divider(),
                  TextFormField(
                    controller: _endController,
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                        color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Endereço",
                        labelStyle:
                            TextStyle(color: ThemeColors.LabelInputForm)),
                  ),
                  Divider(),
                  ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () => indicarInstituicao(
                          context,
                          _nomeController.text,
                          _endController.text,
                          _cepController.text,
                          _telController.text),
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
        ));
  }
}
