import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../style.colors.dart';


class InstituicaoPesquisaPage extends StatefulWidget {
  @override
  _InstituicaoPesquisaPageState createState() => _InstituicaoPesquisaPageState();
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
                  style: new TextStyle(color: ThemeColors.BlackColor, fontSize: 20),
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
                    setState(() { dropdownEstadoValue= value;});
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
                  style: TextStyle(color: ThemeColors.LabelInputForm, fontSize: 16),
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
                    setState(() { dropdownCidadeValue= value;});
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
                  style: TextStyle(color: ThemeColors.LabelInputForm, fontSize: 16),
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
                    setState(() { dropdownBairroValue= value;});
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
                  style: TextStyle(color: ThemeColors.LabelInputForm, fontSize: 16),
                  isDense: true,
                  iconSize: 30.0,
                  iconEnabledColor: Colors.black,
                ), 

               

                
                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO_PESQUISA_RESULT)
                    },
                    child: Text("Pesquisar",
                      style: TextStyle(color: Colors.white),
                    ),
                    color: ThemeColors.PrimaryColor,
                  ),
                ),

                

              ],
            ),
          ),
        )
    );
  }
}
