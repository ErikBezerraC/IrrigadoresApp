import 'dart:ui';

import 'package:flutter/material.dart';

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
                "",
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
      body: Align(alignment: Alignment.topCenter),
    );
  }
}
