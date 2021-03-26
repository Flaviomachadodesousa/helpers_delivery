import 'package:flutter/material.dart';
import 'package:svdd/src/view/Home_Index.dart';
import 'package:svdd/src/view/Localizacao.dart';
import 'package:svdd/src/view/Mercado.dart';
import 'package:svdd/src/view/Profile.dart';
import 'package:svdd/src/view/SplashScreen.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.

  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: new ThemeData(
        primarySwatch: Colors.red,
      ),
      routes: {
        "/": (BuildContext context) => HomeSplashScreen(),
        "/index": (BuildContext context) => HomeIndex(),
        "/profile": (BuildContext context) => Profile(),
        "/localizacao": (BuildContext context) => Localizacao(),
        "/mercado": (BuildContext context) => Mercado(),
      },
    );
  }
}
