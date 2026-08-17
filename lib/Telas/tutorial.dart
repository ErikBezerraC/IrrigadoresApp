import 'package:flutter/material.dart';

class Tutorial extends StatefulWidget {
  const Tutorial({super.key});

  @override
  State<Tutorial> createState() => _TutorialState();
}

class _TutorialState extends State<Tutorial> {
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
                  child: Text("Tutorial", style: TextStyle(
                      color: Colors.white,
                      fontSize: 25,
                      fontWeight: FontWeight.bold
                  ),),
                )
            ),
          )
      ),

      backgroundColor: Color(0xff87a277),
    );
  }
}
