import 'package:doacoes_remedios/components/custom_bottom_navigation_bar.dart';
import 'package:doacoes_remedios/models/instituicao.model.dart';
import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';
import '../config.dart';
import '../style.colors.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

//
Future<List<Instituicao>> pesquisar(BuildContext context) async {
  List<Instituicao> lista = await obterIntituicoes();
  Navigator.of(context).pushNamed(
    AppRoutes.INSTITUICAO_PESQUISA_RESULT,
    arguments: {'resultado': lista},
  );
}

Future<List<Instituicao>> obterIntituicoes() async {
  //String nome, String endereco, String cep, String telefone) async {
  final http.Response response =
      await http.get(Uri.parse(Config.APIEndpoint + '/instituicoes'));
  // debugPrint(response.statusCode.toString() +
  //     " - " +
  //     response.reasonPhrase +
  //     " - " +
  //     response.body);
  if (response.statusCode == 200) {
    var data = jsonDecode(response.body);

    List<Instituicao> instituicoes =
        List<Instituicao>.from(data.map((x) => Instituicao.fromJson(x)));
    //debugPrint("tudo ok " + instituicoes.length.toString());
    return instituicoes;
  } else {
    debugPrint(response.statusCode.toString() + " - " + response.reasonPhrase);
    throw Exception('Ocorreu um erro ao obter a listagem de instituicoes');
  }
}

// Future<Instituicao> obterIntituicoes() async {
//   final response =
//       await http.get(Uri.parse('https://jsonplaceholder.typicode.com/albums/1'));

//   if (response.statusCode == 200) {
//     return Album.fromJson(jsonDecode(response.body));
//   } else {
//     throw Exception('Failed to load album');
//   }
// }

class InstituicaoPesquisaPage extends StatefulWidget {
  @override
  _InstituicaoPesquisaPageState createState() =>
      _InstituicaoPesquisaPageState();
}

class _InstituicaoPesquisaPageState extends State<InstituicaoPesquisaPage> {
  final TextEditingController _nomeController = TextEditingController();

  String dropdownEstadoValue = 'Estado';
  String dropdownCidadeValue = 'Cidade';
  String dropdownBairroValue = 'Bairro';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('Pesquisa de Instituições'),
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
                style:
                    new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
                decoration: InputDecoration(
                    labelText: "Nome",
                    labelStyle: TextStyle(color: ThemeColors.LabelInputForm)),
              ),
              Divider(),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: "Estado",
                    child: Text("Estado"),
                  ),
                  DropdownMenuItem<String>(
                    value: "SP",
                    child: Text("São Paulo"),
                  ),
                ],
                onChanged: (value) async {
                  setState(() {
                    dropdownEstadoValue = value;
                  });
                },
                value: dropdownEstadoValue,
                // validator: (value) => value == null
                //   ? 'Please fill in your gender': null,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                elevation: 2,
                style:
                    TextStyle(color: ThemeColors.LabelInputForm, fontSize: 16),
                isDense: true,
                iconSize: 30.0,
                iconEnabledColor: Colors.black,
              ),
              DropdownButtonFormField<String>(
                items: [
                  DropdownMenuItem<String>(
                    value: "Cidade",
                    child: Text("Cidade"),
                  ),
                  DropdownMenuItem<String>(
                    value: "SP",
                    child: Text("São Paulo"),
                  ),
                ],
                onChanged: (value) async {
                  setState(() {
                    dropdownCidadeValue = value;
                  });
                },
                value: dropdownCidadeValue,
                // validator: (value) => value == null
                //   ? 'Please fill in your gender': null,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                elevation: 2,
                style:
                    TextStyle(color: ThemeColors.LabelInputForm, fontSize: 16),
                isDense: true,
                iconSize: 30.0,
                iconEnabledColor: Colors.black,
              ),
              DropdownButtonFormField<String>(
                items: <String>['Bairro', 'Vila nova curuçá', 'Centro', 'Mooca']
                    .map<DropdownMenuItem<String>>((String value) {
                  return DropdownMenuItem<String>(
                    value: value,
                    child: Text(value),
                  );
                }).toList(),
                onChanged: (value) async {
                  setState(() {
                    dropdownBairroValue = value;
                  });
                },
                value: dropdownBairroValue,
                // validator: (value) => value == null
                //   ? 'Please fill in your gender': null,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide: BorderSide(color: Colors.white),
                  ),
                ),
                elevation: 2,
                style:
                    TextStyle(color: ThemeColors.LabelInputForm, fontSize: 16),
                isDense: true,
                iconSize: 30.0,
                iconEnabledColor: Colors.black,
              ),
              Divider(),
              ButtonTheme(
                height: 60.0,
                child: RaisedButton(
                  onPressed: () => pesquisar(context),
                  child: Text(
                    "Pesquisar",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: ThemeColors.PrimaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }
}
