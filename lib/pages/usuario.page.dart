import 'package:doacoes_remedios/components/custom_bottom_navigation_bar.dart';
import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../style.colors.dart';

class UsuarioPage extends StatelessWidget {
  const UsuarioPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color.fromRGBO(186, 213, 217, 1),
        appBar: AppBar(
          title: Text('Perfil'),
          automaticallyImplyLeading: false,
          backgroundColor: ThemeColors.AppBarColor,
        ),
        body: Padding(  
          padding: const EdgeInsets.all(8),
          child: ListView(
              children: [
                Row(
                  children: [
                    Container(
                      width: 100,
                      height: 100,
                      padding: const EdgeInsets.all(8),
                      color: ThemeColors.WhiteColor,
                      child: Center(child: Text("FA", style: TextStyle(fontSize: 20),)),
                    ),
                    Container(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Fabiano Alves", style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
                          Text("fabianoar@hotmail.com", style: TextStyle(fontSize: 17),),
                        ]
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 30.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      FlatButton(
                          onPressed: (){
                            Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                          },
                          child: Text("Editar", style: TextStyle(fontSize: 18, color: ThemeColors.PrimaryColor, fontWeight: FontWeight.bold),),
                      ),
                      FlatButton(
                        onPressed: (){
                          Navigator.of(context).pushNamed(AppRoutes.LOGIN);
                        },
                        child: Text("Sair", style: TextStyle(fontSize: 18, color: ThemeColors.PrimaryColor, fontWeight: FontWeight.bold),),
                      )

                    ],
                  ),
                ),
             ]),
          ),
      bottomNavigationBar: CustomBottomNavigationBar(currentIndex: 2),
    );
  }
}
