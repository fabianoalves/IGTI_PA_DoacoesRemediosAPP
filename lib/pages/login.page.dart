import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO_PESQUISA);
    return Scaffold(
        backgroundColor: Colors.lightBlue,
        body: Padding(
          padding: EdgeInsets.all(10),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              mainAxisAlignment: MainAxisAlignment.center,

              children: <Widget>[
                TextFormField(
                  autofocus: true,
                  keyboardType: TextInputType.emailAddress,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                TextFormField(
                  autofocus: true,
                  obscureText: true,
                  keyboardType: TextInputType.text,
                  style: new TextStyle(color: Colors.white, fontSize: 20),
                  decoration: InputDecoration(
                      labelText: "Senha",
                      labelStyle: TextStyle(color: Colors.white)),
                ),
                Divider(),
                Center(
                  child: RichText(                                        
                    text: TextSpan(                      
                      children: [
                        TextSpan(
                          text: 'Criar nova conta',
                          style: TextStyle(height: 2,color: Colors.white, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () { 
                              Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                          },
                        ), 
                        TextSpan(text: '   |   ',),               
                        TextSpan(
                          text: 'Esqueci a senha',                          
                          style: TextStyle(height: 2,color: Colors.white, fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () { 
                              Navigator.of(context).pushNamed(AppRoutes.USER_RECUPERAR_SENHA);
                          },
                        ),


                      ],
                    ),
                  ),
                ),



              


                Divider(),
                ButtonTheme(
                  height: 60.0,
                  child: RaisedButton(
                    onPressed: () => {
                      Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO)
                    },
                    child: Text(
                      "Entrar",
                      style: TextStyle(color: Colors.lightBlue),
                    ),
                    color: Colors.white,
                  ),
                ),
                
              ],
            ),
          ),
        ));
  }
}
