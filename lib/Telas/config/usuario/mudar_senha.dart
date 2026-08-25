import 'package:flutter/material.dart';

class MudarSenha extends StatefulWidget {
  const MudarSenha({super.key});

  @override
  State<MudarSenha> createState() => _MudarSenhaState();
}

class _MudarSenhaState extends State<MudarSenha> {
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
                    "Alterar Senha",
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

      body:
          Padding(
              padding: EdgeInsetsGeometry.only(top: 10,),

            child: ListView(
             children: [
               buildContainer("Senha Atual","Digite sua senha"),
               SizedBox(height: 29,),
               buildContainer("Senha Nova","Digite sua nova senha"),
               SizedBox(height: 30,),
               buildContainer("Confirmar Senha","Digite sua nova senha"),
               SizedBox(height: 100,),
               //botao futuramente
               Center(
                 child: SizedBox(
                   width: 250,
                   height: 50,
                   child: ElevatedButton(
                     onPressed: () {
                       print("Senha enviada!");
                     },
                     style: ElevatedButton.styleFrom(
                       backgroundColor: const Color(0xffa5c994),
                       foregroundColor: Colors.white,
                       shape: RoundedRectangleBorder(
                         borderRadius: BorderRadius.circular(10),
                       ),
                     ),
                     child: const Text(
                       "Alterar Senha",
                       style: TextStyle(
                         fontSize: 18,
                         fontWeight: FontWeight.bold,
                       ),
                     ),
                   ),
                 ),
               ),
             ],
            )
          ),
    );
  }
}

buildContainer(String text,String text_2){
  return Container(
    child: Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsetsGeometry.only(left: 20,),
          child: Row(
            children: [
              Text(
                text,
                style: const TextStyle(
                  color: Color(0xffdcdcdc),
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                width: 3,
              ),
              Text(
                "*",
                style: const TextStyle(
                  color: Colors.redAccent,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            style: const TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
            obscureText: true,
            decoration: InputDecoration(
              hintText: text_2,
              hintStyle: const TextStyle(
                color: Colors.white,
                fontSize: 16,
              ),

              // Fundo transparente
              filled: true,
              fillColor: Colors.transparent,

              // Tamanho/altura menor
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 12,
                vertical: 10,
              ),

              // Borda normal
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Color(0xffdcdcdc),
                  width: 1,
                ),
              ),

              // Borda quando clicar no campo
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5),
                borderSide: const BorderSide(
                  color: Colors.white,
                  width: 2,
                ),
              ),
            ),
          ),
        ),




      ],
    ),
  );
}
