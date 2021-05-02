import 'package:flutter/material.dart';

import '../style.colors.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {


  @override
  Widget build(BuildContext context) {
    //Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO_PESQUISA);
    return Scaffold(
        backgroundColor: ThemeColors.LoginBackGround,
        body: Padding(
          padding: EdgeInsets.all(20),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                Container(
                  child: Image.asset('assets/images/logo.jpeg', height: 200,)
                ),
                

                
                
                
              ],
            ),
          ),
        ));
  }
}
