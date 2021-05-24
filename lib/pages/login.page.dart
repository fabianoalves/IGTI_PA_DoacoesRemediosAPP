import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

import '../style.colors.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    //Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO_PESQUISA);
    return Scaffold(
        backgroundColor: ThemeColors.LoginBackGround,
        body: ListView(children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: Center(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Container(
                      child: Image.asset(
                    'assets/images/logo.jpeg',
                    height: 200,
                  )),
                  TextFormField(
                    autofocus: true,
                    keyboardType: TextInputType.emailAddress,
                    style: new TextStyle(
                        color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                      labelText: "E-mail",
                      labelStyle: TextStyle(color: ThemeColors.LabelInputForm),
                    ),
                  ),

                  TextFormField(
                    obscureText: true,
                    keyboardType: TextInputType.text,
                    style: new TextStyle(
                        color: ThemeColors.BlackColor, fontSize: 20),
                    decoration: InputDecoration(
                        labelText: "Senha",
                        labelStyle:
                            TextStyle(color: ThemeColors.LabelInputForm)),
                  ),

                  //Center(
                  RichText(
                    text: TextSpan(
                      children: [
                        // TextSpan(
                        //   text: 'Criar nova conta',
                        //   style: TextStyle(height: 2,color: ThemeColors.PrimaryColor, fontWeight: FontWeight.bold),
                        //   recognizer: TapGestureRecognizer()
                        //     ..onTap = () {
                        //       Navigator.of(context).pushNamed(AppRoutes.USER_FORM);
                        //   },
                        // ),
                        //TextSpan(text: '   |   ',),
                        TextSpan(
                          text: 'Esqueci a senha',
                          style: TextStyle(
                              height: 2,
                              color: ThemeColors.PrimaryColor,
                              fontWeight: FontWeight.bold),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.of(context)
                                  .pushNamed(AppRoutes.USER_RECUPERAR_SENHA);
                            },
                        ),
                      ],
                    ),
                  ),
                  //),

                  Divider(),

                  ButtonTheme(
                    height: 60.0,
                    child: RaisedButton(
                      onPressed: () => {
                        Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO)
                      },
                      child: Text(
                        "Entrar",
                        style: TextStyle(color: ThemeColors.WhiteColor),
                      ),
                      color: ThemeColors.PrimaryColor,
                    ),
                  ),
                  Divider(),

                  TextButton(
                    child: Text("Nova Conta".toUpperCase(),
                        style: TextStyle(fontSize: 14)),
                    style: ButtonStyle(
                        padding: MaterialStateProperty.all<EdgeInsets>(
                            EdgeInsets.all(15)),
                        foregroundColor: MaterialStateProperty.all<Color>(
                            ThemeColors.PrimaryColor),
                        shape:
                            MaterialStateProperty.all<RoundedRectangleBorder>(
                                RoundedRectangleBorder(
                                    //borderRadius: BorderRadius.circular(18.0),
                                    side: BorderSide(
                                        color: ThemeColors.PrimaryColor)))),
                    onPressed: () =>
                        Navigator.of(context).pushNamed(AppRoutes.USER_FORM),
                  ),
                ],
              ),
            ),
          ),
        ]));
  }
}
