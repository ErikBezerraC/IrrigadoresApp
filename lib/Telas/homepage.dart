import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irrigadorapp/Telas/config.dart';
import 'package:irrigadorapp/Telas/Irrigadores.dart';


class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List pages = [
    Irrigadores(),
    Config(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xFF8D5CD1),
          currentIndex: selectedIndex, //o index da barra (cada posição do item) fica correspondente a variavel que declaramos
          showSelectedLabels: true, //coloca o nome dos itens nao selecionados
          unselectedItemColor: Colors.grey, //coloca cor nos itens que nao tiverem selecionados
          selectedItemColor: Colors.white, //colcoa uam cor especifica para o item selecionado
          type: BottomNavigationBarType.fixed, //tira o movimento na hora de apertar em uma item
          onTap: (index){ //a troca do item fica por toque
            setState(() {
              selectedIndex = index; //atualiza a pagina e troca a tela
            });
          },

          items: [
            BottomNavigationBarItem(icon: Icon(Icons.desktop_windows), label: 'Irrigadores'),
            BottomNavigationBarItem(icon: Icon(Icons.settings), label: 'Configurações'),
          ]),

    );
  }
}