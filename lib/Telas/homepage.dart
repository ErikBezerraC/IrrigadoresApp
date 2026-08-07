import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:irrigadorapp/Telas/config/config.dart';
import 'package:irrigadorapp/Telas/Irrigadores.dart';
import 'package:irrigadorapp/Telas/tutorial.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int selectedIndex = 0;

  List pages = [
    Irrigadores(),
    Tutorial(),
    Config(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: pages[selectedIndex],

      bottomNavigationBar: BottomNavigationBar(
        backgroundColor: const Color(0xff66885f),

        currentIndex: selectedIndex,

        showSelectedLabels: true,
        unselectedItemColor: Colors.grey,
        selectedItemColor: Colors.white,

        // Ícone selecionado fica maior
        selectedIconTheme: const IconThemeData(
          size: 32,
        ),

        // Ícones não selecionados ficam menores
        unselectedIconTheme: const IconThemeData(
          size: 24,
        ),

        type: BottomNavigationBarType.fixed,

        onTap: (index) {
          setState(() {
            selectedIndex = index;
          });
        },

        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.desktop_windows),
            label: 'Irrigadores',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.school),
            label: 'Tutorial',
          ),

          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Configurações',
          ),
        ],
      ),
    );
  }
}