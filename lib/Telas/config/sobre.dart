import 'package:flutter/material.dart';

class Sobre extends StatefulWidget {
  const Sobre({super.key});

  @override
  State<Sobre> createState() => _SobreState();
}

class _SobreState extends State<Sobre> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: Color(0xff87a277)
        ,
        title
            :
        Container
          (
          width: 350,
          height: 50,
          decoration:
          BoxDecoration
            (color
              :
          const
          Color
            (
              0xffa5c994
          )
            ,
            borderRadius
                :
            BorderRadius
                .
            circular
              (
                15
            )
            ,
          )
          ,
          child
              :
          Row
            (
            children
                :
            [
              IconButton
                (
                onPressed
                    :
                    () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back, color: Colors.white),
              ),

              const Expanded(
                child: Center(
                  child: Text(
                    "Sobre",
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
            padding: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              color: const Color(0xff7a9b6e),
              borderRadius: BorderRadius.circular(15),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Container(
                    width: 320,
                    height: 200,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(
                        color: Colors.white,
                        width: 5,
                      ),
                    ),
                  ),

                  const SizedBox(height: 15),

                  const Text(
                    "O Irriga Legal é um projeto que busca facilitar e "
                        "automatizar a irrigação por meio de um aplicativo. "
                        "Nele, o usuário pode acompanhar a umidade do solo, "
                        "a vazão e o consumo de água, além de verificar se o "
                        "sistema está ligado ou desligado. O aplicativo também "
                        "permite programar os horários de irrigação e controlar "
                        "a quantidade de água utilizada, tornando o processo "
                        "mais eficiente e econômico.",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}