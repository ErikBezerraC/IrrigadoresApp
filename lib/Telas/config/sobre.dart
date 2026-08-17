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

      body:Align(
        alignment: Alignment.topCenter,
        child: Padding(
          padding: const EdgeInsets.only(top: 10),
          child: Column(
            children: [

              Container(
                width: 360,
                height: 500,
                decoration: BoxDecoration(
                  color: const Color(0xff7a9b6e),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [

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
