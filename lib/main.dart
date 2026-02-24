import 'package:essai/view/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  // Fonction main qui est mon point de départ
  runApp(
    const MyApp(),
  ); // runApp qui est la racine de mon application précédé de l'optimisation
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  // widget principal n'aant pas d'etat

  @override
  Widget build(BuildContext context) {
    //methode retournant toujours un widget
    return MaterialApp(
      // lui c'ets le moteur de l'application
      home: MyHomePage(title: 'Gmail'), // MyHomePage ecran mère
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: false,
      ),
    );
  }
}
