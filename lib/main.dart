import 'package:flutter/material.dart';
import 'package:projet_flutter/view/acceuil.view.dart';

void main (){
  runApp(Main());
}

class Main extends StatelessWidget{
  const Main ({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/home": (context)=> Acceuil(),

      },
      initialRoute: "/home",
    );
  }
}