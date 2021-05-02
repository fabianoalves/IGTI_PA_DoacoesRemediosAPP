import 'package:doacoes_remedios/models/instituicao.model.dart';
import 'package:flutter/material.dart';

import '../style.colors.dart';

const List<Instituicao> opcoes = const <Instituicao>[
  const Instituicao(titulo: 'SUS são paulo', 
  endereco: 'AV. Flamingo, 61 - Vila nova curuça - São paulo/SP', 
  telefone: '(11) 2035-3155',
  cep: '08031-000'),

    const Instituicao(titulo: 'SUS Curuça', 
  endereco: 'AV. Flamingo, 61 - Vila nova curuça - São paulo/SP', 
  telefone: '(11) 2035-3155',
  cep: '08031-000'),


];





class InstituicaoPesquisaResultPage extends StatefulWidget {
  @override
  _InstituicaoPesquisaResultPageState createState() => _InstituicaoPesquisaResultPageState();
}

class _InstituicaoPesquisaResultPageState extends State<InstituicaoPesquisaResultPage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(186, 213, 217, 1),
        appBar: AppBar(
          title: Text('Resultado da Pesquisa'),
          backgroundColor: ThemeColors.AppBarColor,
          automaticallyImplyLeading: true,
          leading: IconButton(icon:Icon(Icons.arrow_back,color: Colors.white,),
            onPressed:() => Navigator.pop(context, false),
          )
        ),

        body: ListView.builder(
          padding: const EdgeInsets.all(10),
          itemCount: opcoes.length,
          itemBuilder: _instituicaoCard,
          
        ),        
    );
  }

  Widget _instituicaoCard(BuildContext context, int index) {
    return InkWell(      
      child: Card( 
        
        child: Padding(
          padding: EdgeInsets.all(16.0),
          child: Column(               
            children:  <Widget>[
              Container(
                margin: EdgeInsets.only(bottom: 10.0),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Text(opcoes[index].titulo, style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black, fontSize: 20, )),
                ),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Text("Tel: " + opcoes[index].telefone, style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
              Align(
                alignment: Alignment.centerLeft,
                child:Text(opcoes[index].endereco, style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),

              Align(
                alignment: Alignment.centerLeft,              
                child:Text("CEP: " + opcoes[index].cep, style: TextStyle(color: Colors.grey, fontSize: 18)),
              ),
                
            ],
          ),
        ),
      ),
      onTap: () => {
        
      },
    );
  }
}
