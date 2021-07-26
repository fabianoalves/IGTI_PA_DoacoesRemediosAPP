import 'package:doacoes_remedios/components/custom_bottom_navigation_bar.dart';
import 'package:doacoes_remedios/models/instituicao.model.dart';
import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../style.colors.dart';

// const List<Instituicao> opcoes = const <Instituicao>[
//   const Instituicao(
//       titulo: 'UBS são paulo',
//       endereco: 'AV. Flamingo, 61 - Vila nova curuça - São paulo/SP',
//       telefone: '(11) 2035-3155',
//       cep: '08031-000'),
//   const Instituicao(
//       titulo: 'UBS Curuçá Velha',
//       endereco: 'Rua Moriçoca, 01 - São Miguel, São Paulo - SP',
//       telefone: '(11) 2035-3152',
//       cep: '08030-500'),
//   const Instituicao(
//       titulo: 'UBS Curuçá Velha',
//       endereco: 'Rua Moriçoca, 01 - São Miguel, São Paulo - SP',
//       telefone: '(11) 2035-3152',
//       cep: '08030-500'),
// ];

class InstituicaoPesquisaResultPage extends StatefulWidget {
  @override
  _InstituicaoPesquisaResultPageState createState() =>
      _InstituicaoPesquisaResultPageState();
}

class _InstituicaoPesquisaResultPageState
    extends State<InstituicaoPesquisaResultPage> {
  List<Instituicao> resultado = [];

  @override
  Widget build(BuildContext context) {
    final arguments = ModalRoute.of(context).settings.arguments as Map;
    resultado = arguments["resultado"];

    return Scaffold(
      backgroundColor: Color.fromRGBO(186, 213, 217, 1),
      appBar: AppBar(
          title: Text('Resultado da Pesquisa'),
          backgroundColor: ThemeColors.AppBarColor,
          automaticallyImplyLeading: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back,
              color: Colors.white,
            ),
            onPressed: () => Navigator.pop(context, false),
          )),
      body: ListView.builder(
        padding: const EdgeInsets.all(10),
        itemCount: resultado.length,
        itemBuilder: _instituicaoCard,
      ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 1),
    );
  }

  Widget _instituicaoCard(BuildContext context, int index) {
    return Card(
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(bottom: 10.0),
              child: Align(
                alignment: Alignment.centerLeft,
                child: Text(resultado[index].nome,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                      fontSize: 20,
                    )),
              ),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(resultado[index].endereco,
                  style: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("CEP: " + resultado[index].cep,
                  style: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
            Align(
              alignment: Alignment.centerLeft,
              child: Text("Tel: " + resultado[index].telefone,
                  style: TextStyle(color: Colors.grey, fontSize: 18)),
            ),
            Divider(),
            Align(
              alignment: Alignment.centerRight,
              child: ButtonTheme(
                height: 40.0,
                child: RaisedButton(
                  onPressed: () => {
                    Navigator.of(context).pushNamed(
                      AppRoutes.MAPA,
                      arguments: {
                        'instituicoes': <Instituicao>[resultado[index]]
                      },
                    )

                    //Navigator.of(context).pushNamed(AppRoutes.MAPA)
                  },
                  child: Text(
                    "Ver Mapa",
                    style: TextStyle(color: Colors.white),
                  ),
                  color: ThemeColors.PrimaryColor,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
