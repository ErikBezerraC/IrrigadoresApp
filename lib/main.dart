import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:irrigadorapp/Provider/irrigadores_provider.dart';
import 'package:irrigadorapp/Telas/homepage.dart';
import 'package:irrigadorapp/Telas/login.dart';
import 'package:irrigadorapp/Telas/splash_page.dart';

void main() {
  //runApp(MaterialApp(home: HomePage()));
  runApp(
    ChangeNotifierProvider(
      create: (_) => IrrigadoresProvider(),
      child: MaterialApp(home: SplashPage()),
    ),
  );
}
