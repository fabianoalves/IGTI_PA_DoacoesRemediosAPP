import 'package:doacoes_remedios/routes/app_routes.dart';
import 'package:flutter/material.dart';

import '../style.colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  final int currentIndex;
  const CustomBottomNavigationBar({Key key, this.currentIndex}) : super(key: key);

  @override
  _CustomBottomNavigationBarState createState() => _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: widget.currentIndex,
      selectedItemColor: ThemeColors.PrimaryColor,
      //unselectedItemColor: ThemeColors.SecondaryColor,
      items: [
        BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: "Início"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: "Buscar"
        ),
        BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Perfil"
        ),
      ],
      onTap: (index) {
        if(index == widget.currentIndex)
          return;
        if (index == 0) {
          Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO);
          return;
        }
        if (index == 1) {
          Navigator.of(context).pushNamed(AppRoutes.INSTITUICAO_PESQUISA);
          return;
        }
        if (index == 2) {
          Navigator.of(context).pushNamed(AppRoutes.USER);
          return;
        }
      },
    );
  }
}


/*
class CustomBottomNavigationBar extends StatelessWidget {
  const CustomBottomNavigationBar({Key key}) : super(key: key);
  int _currentIndex = 0;
  @override
  Widget build(BuildContext context) {

  }
}*/
