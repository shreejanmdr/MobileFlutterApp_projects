import 'package:flutter/material.dart';
import 'package:number_generatorr/screen/number_generator.dart';
import 'package:number_generatorr/screen/s.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: NumberGeneratorScreen(),
      //home: GameScreen(),
      //home: NumberScreen(),
    );
  }
}
