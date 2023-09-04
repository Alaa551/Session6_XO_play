import 'dart:math';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../widgets/customAlertDialog.dart';

class GameProvider extends ChangeNotifier {
  String playWith="computer";
  final List<String> _xAndOList = ["", "", "", "", "", "", "", "", ""];
  static const List<List<int>> winPossibilities = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6]
  ];
  String _lastPlay = "";
  static int _scoreX = 0;
  static int _scoreO = 0;
  int _filledCells = 0;
  String winner = "";

  List<String> get xAndOList => _xAndOList;

  String get lastPlay => _lastPlay;

  int get scoreX => _scoreX;

  int get scoreO => _scoreO;

  int get filledCells => _filledCells;

  void beginGame() {
    playAgain();
    _scoreX = 0;
    _scoreO = 0;
    notifyListeners();
  }

  void onPressOnButton(int index, BuildContext context) {
    if (_lastPlay == "" && _xAndOList[index] == "") {
      _xAndOList[index] = "X";
      _lastPlay = "X";
      _filledCells++;
    } else if (_lastPlay == "X" && _xAndOList[index] == "") {
      _xAndOList[index] = "O";
      _lastPlay = "O";
      _filledCells++;
    } else if (_lastPlay == "O" && _xAndOList[index] == "") {
      _xAndOList[index] = "X";
      _lastPlay = "X";
      _filledCells++;
    }


   // print(playWith);
    if(playWith=="computer") {
      if (_lastPlay == "X" && _filledCells <= 8) {
        computerPlay();
      }
    }
    if (checkWinner()) {
      displayWinner(context);
    } else if (_filledCells == 9) {
      displayDraw(context);
    }
    notifyListeners();
  }

    void computerPlay(){

    int randomIndex;
    randomIndex =  Random().nextInt(9);
    //print(randomIndex);

    while (_xAndOList[randomIndex] != "") {
      randomIndex = Random().nextInt(9);
    }
    _lastPlay == "X"
        ?{ _xAndOList[randomIndex] = "O",
           _lastPlay="O"}
        : {_xAndOList[randomIndex] = "X" ,_lastPlay="X"};
    _filledCells++;

    notifyListeners();
  }

  bool checkWinner() {
    for (var item in winPossibilities) {
      if (_xAndOList[item[0]].isNotEmpty &&
          _xAndOList[item[0]] == _xAndOList[item[1]] &&
          _xAndOList[item[1]] == _xAndOList[item[2]]) {
        winner = xAndOList[item[0]];
        return true;
      }
    }
    return false;
  }

  void displayWinner(BuildContext context) {
    winner == "X" ? _scoreX++ : _scoreO++;
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomAlertDialog(
              title: "Winner is $winner",
            ));
    notifyListeners();
  }

  void displayDraw(BuildContext context) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (context) => CustomAlertDialog(title: "Draw"));
  }

  void playAgain() {
    xAndOList.asMap().forEach((key, value) {
      xAndOList[key] = "";
    });
    _lastPlay = "";
    _filledCells = 0;
    notifyListeners();
  }


}
