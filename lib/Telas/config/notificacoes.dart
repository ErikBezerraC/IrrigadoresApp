import 'package:flutter/material.dart';
import 'package:irrigadorapp/Widget/notificacao.dart';

class Notificacoes extends StatefulWidget {
  const Notificacoes({super.key});

  @override
  State<Notificacoes> createState() => _NotificacoesState();
}

class _NotificacoesState extends State<Notificacoes> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
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
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),

              const Expanded(
                child: Center(
                  child: Text(
                    "Notificações",
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
          child: Column(
            children: [

              Container(
                width: 360,
                height: 160,
                decoration: BoxDecoration(
                  color: const Color(0xff7a9b6e),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 5, left: 5),
                        child: Text(
                          'Ultima Notificação',
                          style: const TextStyle(
                            color: Color(0xffdcdcdc),
                            fontSize: 19,
                            fontWeight: FontWeight.bold,
                          ),
                        ),

                      ),

                      SizedBox(height: 10,),

                      Center(
                        child: Notificacao(not:'O solo está seco (2/10)', hora: '13:28'),
                      ),
                  ]
                ),
              ),

              SizedBox(height: 10,),

              Container(
                width: 360,
                height: 213,
                decoration: BoxDecoration(
                  color: const Color(0xff7a9b6e),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      
                      containerNot(
                          'Notificações da Tela de Bloqueio',
                          Icons.phone_android,
                              (){

                      }),

                      linha(),

                      containerNot(
                          'Não Pertube',
                          Icons.lock_outline,
                              (){

                          }),

                      linha(),

                      containerNot(
                          'Histórico de Notificações',
                          Icons.history,
                              (){

                          }),


                    ]
                ),
              ),


            ],
          ),
        ),
      ),
    );
  }
}

Widget containerNot(String text, IconData icon, VoidCallback onTap) {
  return ListTile(
    onTap: onTap,
    leading: Icon(icon, color: Colors.white),
    title: Text(
      text,
      style: const TextStyle(
        color: Color(0xffdcdcdc),
        fontSize: 16,
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
