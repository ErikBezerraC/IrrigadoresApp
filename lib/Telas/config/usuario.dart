import 'package:flutter/material.dart';

class Usuario extends StatefulWidget {
  const Usuario({super.key});

  @override
  State<Usuario> createState() => _UsuarioState();
}

class _UsuarioState extends State<Usuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar:AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff87a277),
          title: Container(
        width: 350,
        height: 50,
        decoration: BoxDecoration(
          color: const Color(0xffa5c994),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Row(
          children: [
            IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
            ),

            const Expanded(
              child: Center(
                child: Text(
                  "Usuário",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),

            const SizedBox(width: 48), // Equilibra o espaço da seta
          ],
        ),
      ),
      ),

      backgroundColor: Color(0xff87a277),

      body: Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Container(
              width: 360,
              height: 335,
              decoration: BoxDecoration(
                color: const Color(0xff7a9b6e),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: Icon(
                      Icons.person,
                      color: Colors.white,
                    ),
                    title: Text(
                      "Exemplo Barbosa",
                      style: const TextStyle(
                        color: Color(0xffdcdcdc),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),

                  linha(),

                  ListTile(
                    leading: Icon(
                      Icons.email_outlined,
                      color: Colors.white,
                    ),
                    title: Text(
                      "exemplo@gmail.com",
                      style: const TextStyle(
                        color: Color(0xffdcdcdc),
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  
                  linha(),
                  
                  containerConfig(
                      "Alterar Senha",
                      Icons.lock_outline,
                          (){

                  }),

                  linha(),

                  containerConfig(
                      "Alterar Email",
                      Icons.markunread_mailbox_outlined,
                          (){

                      }),

                  linha(),

                  containerConfig(
                      "Alterar Nome",
                      Icons.contact_mail_outlined,
                          (){

                      })
                ],
              )
          ),
        ),
      ),

    );
  }
}

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