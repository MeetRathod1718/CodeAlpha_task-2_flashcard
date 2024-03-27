import 'package:flashcard/flashcard.dart';
import 'package:flashcard/flashcard_view.dart';
import 'package:flutter/material.dart';
import 'package:flip_card/flip_card.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  List<flashcard> _flashcard = [
    flashcard(question: "what language does flutter use?", answer: "Dart"),
    flashcard(
        question: "What type of language is Java",
        answer: "Object Oriented Programming"),
    flashcard(
        question: "Is HTML case sensitive or case Insensitive langauge",
        answer: "Case Insensitive"),
    flashcard(
        question: "Which language is best for developing websites?",
        answer: "HTML,CSS & PHP"),
  ];
  int _currIndex = 0;

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            appBar: AppBar(title: Text('FashCard Quiz')),
            body: Center(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                  SizedBox(
                      key: UniqueKey(),
                      width: 250,
                      height: 250,
                      child: FlipCard(
                          front: FlashCardView(
                              text: _flashcard[_currIndex].question),
                          back: FlashCardView(
                              text: _flashcard[_currIndex].answer))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      OutlinedButton.icon(
                          onPressed: previouscard,
                          icon: Icon(Icons.chevron_left),
                          label: Text("Prev")),
                      OutlinedButton.icon(
                          onPressed: nextcard,
                          icon: Icon(Icons.chevron_right),
                          label: Text("Next")),
                    ],
                  )
                ]))));
  }

  void nextcard() {
    setState(() {
      _currIndex = (_currIndex + 1 < _flashcard.length) ? _currIndex + 1 : 0;
    });
  }

  void previouscard() {
    _currIndex = (_currIndex - 1 >= 0) ? _currIndex - 1 : _flashcard.length - 1;
  }
}
