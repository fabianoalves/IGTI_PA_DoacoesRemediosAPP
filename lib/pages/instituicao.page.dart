import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';


class Opcao {
  const Opcao({this.titulo, this.icon, this.rota});
  final String titulo;
  final IconData icon;
  final String rota;
}
const List<Opcao> opcoes = const <Opcao>[
  const Opcao(titulo: 'Pesquisar', icon: Icons.search, rota: AppRoutes.INSTITUICAO_PESQUISA),
  const Opcao(titulo: 'Indicar', icon: Icons.add_business_outlined , rota: AppRoutes.INSTITUICAO_INDICACAO),
];


class OpcaoCard extends StatelessWidget {
  const OpcaoCard({Key key, this.opcao}) : super(key: key);
  final Opcao opcao;
  @override
  Widget build(BuildContext context) {
    final TextStyle textStyle = Theme.of(context).textTheme.bodyText1;
    return 
    InkWell(   
      child:Card(
        color: Colors.white,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Icon(opcao.icon, size:40.0, color: textStyle.color),
              Text(opcao.titulo, style: textStyle),
            ]
          ),
        ),
      ),
      onTap: () => {
        Navigator.of(context).pushNamed(opcao.rota)
      },
    );
  }
}

class InstituicaoPage extends StatefulWidget {
  @override
  _InstituicaoPageState createState() => _InstituicaoPageState();
}

class _InstituicaoPageState extends State<InstituicaoPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(186, 213, 217, 1),
        appBar: AppBar(
          title: Text('Instituições'),
          automaticallyImplyLeading: false,
        ),
        /*floatingActionButton: new FloatingActionButton(
          child: new Icon(Icons.fullscreen_exit),
          onPressed: () {
            Navigator.pushReplacementNamed(context, "/logout");
          },
        ),*/
        body: GridView.count(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          padding: EdgeInsets.all(30),
          children: List.generate(opcoes.length, (index) {
              return Center(
                child: OpcaoCard(opcao: opcoes[index]),
              );
           }
          )
        )     
    );
  }

}
