import 'package:flutter/material.dart';

class Score extends ChangeNotifier {
  int score1 = 0;
  int score2 = 0;
  int score3 = 0;
  bool sideOneServer = true;

  List<String> players = ["John", 'Bob', 'Jerry', 'Steve'];

  String getElement(int index) {
    String returnString = "";
    if ([0, 3].contains(index)) {
      returnString = sideOneServer ? 'Serve' : 'Recv';
    } else {
      returnString = sideOneServer ? 'Recv' : 'Serve';
    }

    return returnString;
  }

  Color getButtonColor(int index) {
    Color retColor = Colors.black;

    if ([0, 1].contains(index)) {
      retColor = sideOneServer
          ? (score1 + index).isEven
              ? Colors.green
              : Colors.red
          : Colors.blue;
    } else {
      retColor = !sideOneServer
          ? (score3 + index).isEven
              ? Colors.green
              : Colors.red
          : Colors.blue;
    }

    return retColor;
  }

// hit button will show which side won the rally
// if it is the same side that served, the points for that side will inc.
  void hitButton(int index) {
    // if 0 or 1, side one won the rally, else side two did.
    if ([0, 1].contains(index)) {
      if (sideOneServer) {
        // inc score for side one
        incrementScore1();
      } else {
        sideOneServer = true;
      }
    } else {
      if (!sideOneServer) {
        // inc score for side one
        incrementScore3();
      } else {
        sideOneServer = false;
      }
    }

    notifyListeners();
  }

  void incrementScore1() {
    score1++;
  }

  void incrementScore2() {
    score2++;
  }

  void incrementScore3() {
    score3++;
  }

  bool over() {
    return (score1 > 10) || (score3 > 10);
  }

  void reset() {
    score1 = score2 = score3 = 0;
    notifyListeners();
  }
}
