import 'package:flutter/material.dart';
import 'package:flutter_animated_splash/flutter_animated_splash.dart';

void main() {
  runApp(Duck());
}

class Duck extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      highContrastDarkTheme: ThemeData.dark(),
      highContrastTheme: ThemeData(),
      home:Duckling() );
  }
}

class Duckling extends StatefulWidget {


  @override
  State<Duckling> createState() => _DucklingState();
}

class _DucklingState extends State<Duckling> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black54,body: Center(child: Image.asset('assets/image/ass.png',width: 300,)),);
  }
}
