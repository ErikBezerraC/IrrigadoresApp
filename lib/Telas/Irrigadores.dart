import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:irrigadorapp/Telas/config/usuario/mudar_email.dart';

class Irrigadores extends StatefulWidget {
  const Irrigadores({super.key});

  @override
  State<Irrigadores> createState() => _IrrigadoresState();
}

class _IrrigadoresState extends State<Irrigadores> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      //
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
              child: Text(
                "IrrigaLegal",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ),
        ),
      ),
      backgroundColor: Color(0xff87a277),
      body: Align(alignment: Alignment.topCenter,
        child: ListView(
          children: [
            Padding (padding: const EdgeInsets.only(top: 5, left: 5),
              child: Column(
                children: [
                  Container(
                    width: 400,
                    height: 300,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child:
                        Row(
                          children: [
                            Text("Irrigador",
                              style: TextStyle(
                                  color: Color(0xff87a277),
                                  fontSize: 15,
                                  fontWeight: FontWeight.bold
                              ),
                            ),
                          ],
                        )
                  ),
                ],
              ),
            )
          ],
        )
    ),
    );
  }
}
