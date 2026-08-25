import 'package:irrigadorapp/db/shared_prefs.dart';
import 'package:irrigadorapp/Telas/homepage.dart';
import 'package:irrigadorapp/Telas/login.dart';
import 'package:flutter/material.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  SharedPrefs prefs = SharedPrefs();

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    bool status = await prefs.getUserStatus();

    // status == true --> true
    // status == true --> false
    if (status) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return HomePage();
          },
        ),
      );
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (context) {
            return LoginPage();
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffbddea4),
      body: Center(
        child:
          Icon(Icons.eco, color: Colors.white, size: 200,)
      ),
    );
  }
}