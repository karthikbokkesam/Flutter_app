import 'package:flutter/material.dart';

import 'package:first_app/quiz.dart';
import 'package:first_app/result.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return _MyAppState();
  }
}

class _MyAppState extends State<MyApp> {
  var _questionIndex = 0;
  var _totalScore = 0;

  void _reset() {
    setState(() {
      _totalScore = 0;
      _questionIndex = 0;
    });
  }

  void _answerQuestion(int score) {
    _totalScore += score;

    setState(() {
      _questionIndex = _questionIndex + 1;
    });

    print(_questionIndex);
  }

  @override
  Widget build(BuildContext context) {
    var _questions = [
      {
        'questionText': "what's your favorite color?",
        'answers': [
          {'text': 'black', 'score': 10},
          {'text': 'red', 'score': 5},
          {'text': 'blue', 'score': 3},
          {'text': 'green', 'score': 1},
        ]
      },
      {
        'questionText': "what's your favorite animal?",
        'answers': [
          {'text': 'rabbit', 'score': 2},
          {'text': 'snake', 'score': 6},
          {'text': 'elephant', 'score': 5},
          {'text': 'lion', 'score': 4}
        ]
      },
      {
        'questionText': "what's your favorite bird?",
        'answers': [
          {'text': 'parrot', 'score': 3},
          {'text': 'tucan', 'score': 2},
          {'text': 'sparrow', 'score': 1},
          {'text': 'eagle', 'score': 5}
        ]
      }
    ];

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('My First App'),
        ),
        body: _questionIndex < _questions.length
            ? Quiz(
                answerQuestion: _answerQuestion,
                questions: _questions,
                questionIndex: _questionIndex,
              )
            : Result(_totalScore, _reset),
      ),
    );
  }
}
