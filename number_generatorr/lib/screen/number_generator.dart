import 'dart:math';
import 'package:flutter/material.dart';

class NumberGeneratorScreen extends StatefulWidget {
  const NumberGeneratorScreen({super.key});

  @override
  State<NumberGeneratorScreen> createState() => _NumberGeneratorScreenState();
}

class _NumberGeneratorScreenState extends State<NumberGeneratorScreen> {
  int _firstNumber = 0;
  int _secondNumber = 0;
  int correctAnswers = 0;
  int incorrectAnswers = 0;
  int rounds = 0;
  bool gameFinished = false;
  final Random _random = Random();
  late Color _color;
  late Color _textColor;

  @override
  void initState() {
    super.initState();
    _color = Colors.yellow;
    _textColor = Colors.black;
    _generateNumbers();
  }

  void _generateNumbers() {
    setState(() {
      do {
        _firstNumber = _random.nextInt(100) + 1;
        _secondNumber = _random.nextInt(100) + 1;
      } while (_firstNumber == _secondNumber);
    });
  }

  void _handleButtonPress(bool isLeftButton) {
    if (gameFinished) return;

    setState(() {
      if (isLeftButton && _firstNumber > _secondNumber ||
          !isLeftButton && _secondNumber > _firstNumber) {
        correctAnswers++;
        _color = Colors.green;
      } else {
        incorrectAnswers++;
        _color = Colors.red;
        _textColor = Colors.black;
      }

      rounds++;
      if (rounds >= 10) {
        gameFinished = true;
      } else {
        _generateNumbers();
      }
    });
  }

  void _restartGame() {
    setState(() {
      _firstNumber = 0;
      _secondNumber = 0;
      correctAnswers = 0;
      incorrectAnswers = 0;
      rounds = 0;
      gameFinished = false;
      _color = Colors.blue;
      _textColor = Colors.black;
      _generateNumbers();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Number Generator Game'),
        centerTitle: true,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed:
                        gameFinished ? null : () => _handleButtonPress(true),
                    child: Text(
                      _firstNumber.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: _textColor,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: 150,
                  height: 150,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orange,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed:
                        gameFinished ? null : () => _handleButtonPress(false),
                    child: Text(
                      _secondNumber.toString(),
                      style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.bold,
                        color: _textColor,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Text(
              'Correct: $correctAnswers  Incorrect: $incorrectAnswers',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: _color,
              ),
            ),
            SizedBox(height: 40),
            if (gameFinished)
              Column(
                children: [
                  Text('Game Over!'),
                  Text('Correct answers: $correctAnswers'),
                  Text('Incorrect answers: $incorrectAnswers'),
                ],
              ),
            SizedBox(height: 40),
            ElevatedButton(
              onPressed: _restartGame,
              child: Text('Restart Game'),
            ),
          ],
        ),
      ),
    );
  }
}
