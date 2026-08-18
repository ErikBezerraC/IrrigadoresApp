import 'package:flutter/material.dart';
import 'package:irrigadorapp/Telas/config/Idioma.dart';
import 'package:irrigadorapp/Telas/config/notificacoes.dart';
import 'package:irrigadorapp/Telas/config/relatorios.dart';
import 'package:irrigadorapp/Telas/config/sobre.dart';
import 'package:irrigadorapp/Telas/config/usuario.dart';
class Config extends StatefulWidget {
  const Config({super.key});

  @override
  State<Config> createState() => _ConfigState();
}

class _ConfigState extends State<Config> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xff87a277),
        title: Center(
          child: Container(
            width: 350,
            height: 50,
            decoration: BoxDecoration(
                color: Color(0xffa5c994),
              borderRadius: BorderRadius.circular(15),

            ),
            child: Center(
              child: Text("Configurações", style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold
              ),),
            )
          ),
        )
      ),

      backgroundColor: Color(0xff87a277),

      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
            width: 360,
            height: 410,
            decoration: BoxDecoration(
              color: const Color(0xff7a9b6e),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                //configurar o perfil do usuario (email, senha, etc)
                containerConfig(
                  "Usuário",
                  Icons.person,
                      () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Usuario(),
                      )
                    );

                  },
                ),

                linha(),
                //configurar notificações

                containerConfig(
                  "Notificações",
                  Icons.notifications,
                      () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Notificacoes(),
                            )
                        );

                  },
                ),

                linha(),
                //trocar idioma do app

                containerConfig(
                  "Idioma",
                  Icons.language,
                      () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Idioma(),
                            )
                        );

                  },
                ),

                linha(),
                //saber mais sobre o projeto e o app

                containerConfig(
                  "Sobre",
                  Icons.info_outline,
                      () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Sobre(),
                            )
                        );

                  },
                ),

                linha(),
                //ver consumo de agua, estatisticas e tals

                containerConfig(
                  "Relatórios",
                  Icons.bar_chart,
                      () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const Relatorios(),
                            )
                        );

                  },
                ),


                linha(),

                containerConfig(
                  "Sair",
                  Icons.door_back_door_outlined,
                      () {

                  },
                ),
              ],
            )
          ),
        ),
      ),

    );
  }
}
//quanbdo criar as telas colocar o navigator push no lugar do print
Widget containerConfig(
    String text,
    IconData icon,
    VoidCallback onTap,
    ) {
  return ListTile(
    onTap: onTap,
    leading: Icon(
      icon,
      color: Colors.white,
    ),
    title: Text(
      text,
      style: const TextStyle(
        color: Color(0xffdcdcdc),
        fontSize: 22,
        fontWeight: FontWeight.bold,
      ),
    ),
    trailing: const Icon(
      Icons.arrow_forward_ios,
      color: Colors.white,
      size: 18,
    ),
  );
}

linha(){
  return Text("___________________________________________________________________________________", style: TextStyle(
    color: Color(0xff5d7755),
    fontWeight: FontWeight.bold,
    fontSize: 9,
  ),);
}