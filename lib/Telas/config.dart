import 'package:flutter/material.dart';
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
          padding: const EdgeInsets.only(top: 20),
          child: Container(
            width: 360,
            height: 500,
            decoration: BoxDecoration(
              color: const Color(0xff7a9b6e),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ContainerConfig(
                  "Usuário",
                  Icons.person,
                      () {

                  },
                ),

                ContainerConfig(
                  "Notificações",
                  Icons.notifications,
                      () {

                  },
                ),

                ContainerConfig(
                  "Segurança",
                  Icons.lock,
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
Widget ContainerConfig(
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
