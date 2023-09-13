import 'package:flutter/material.dart';
import 'package:picklescore/models/game_state.dart';

class Score extends ChangeNotifier {
  GameState curState = GameState();
  GameState prevState = GameState();

  get score1 => curState.score1;
  get score3 => curState.score3;

  String getElement(int index) {
    int teamI = [0, 1].contains(index) ? 0 : 1;
    int sideI = index.isEven ? 0 : 1;
    String returnString = curState.teams[teamI][sideI];

    return returnString;
  }

  Color getButtonColor(int index) {
    if (curState.sideOneServer && curState.positionRightServer && index == 0)
      return Colors.green;
    if (curState.sideOneServer && !curState.positionRightServer && index == 1)
      return Colors.green;
    if (!curState.sideOneServer && !curState.positionRightServer && index == 2)
      return Colors.green;
    if (!curState.sideOneServer && curState.positionRightServer && index == 3)
      return Colors.green;

    return Colors.red;
  }

// hit button will show which side won the rally
// if it is the same side that served, the points for that side will inc.
  void hitButton(bool sideOneWinsRally) {
    prevState = curState.copyWith();
    if (curState.over()) {}
    if (curState.sideOneServer && sideOneWinsRally) {
      curState.incrementScore1();
      curState.switchTeamSides(0);
      curState.positionRightServer = !curState.positionRightServer;
    } else if (!curState.sideOneServer && !sideOneWinsRally) {
      curState.incrementScore3();
      curState.switchTeamSides(1);
      curState.positionRightServer = !curState.positionRightServer;
    } else {
      // switch sides, or go to second server,
      if (curState.firstServer) {
        curState.firstServer = !curState.firstServer;
        curState.positionRightServer = !curState.positionRightServer;
      } else {
        // switch to the first server on the other team,
        curState.firstServer = true;
        curState.positionRightServer = true;
        curState.sideOneServer = !curState.sideOneServer;
      }
    }

    notifyListeners();
  }

  int get scoreSide {
    return curState.firstServer ? 1 : 2;
  }

  void reset() {
    prevState = curState.copyWith();

    curState.reset();

    notifyListeners();
  }

  void rollback() {
    curState = prevState.copyWith();

    notifyListeners();
  }
}
