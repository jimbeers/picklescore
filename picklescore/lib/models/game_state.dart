class GameState {
  GameState copyWith() {
    GameState newState = GameState();
    newState.score1 = this.score1;
    newState.score3 = this.score3;
    newState.sideOneServer = this.sideOneServer;
    newState.positionRightServer = this.positionRightServer;
    newState.firstServer = this.firstServer;
    for (int x = 0; x < 2; x++) {
      for (int y = 0; y < 2; y++) {
        newState.teams[x][y] = teams[x][y];
      }
    }
    return newState;
  }

  List<List<String>> teams = [
    ['Ace', 'Bozo'],
    ['Steve', 'Ted']
  ];

  void switchTeamSides(int i) {
    String s = teams[i][0];
    teams[i][0] = teams[i][1];
    teams[i][1] = s;
  }

  int _score1 = 0;

  int get score1 => _score1;

  set score1(int value) {
    _score1 = value;
  }

  int _score3 = 0;

  int get score3 => _score3;

  set score3(int value) {
    _score3 = value;
  }

  bool _sideOneServer = true;

  bool get sideOneServer => _sideOneServer;

  set sideOneServer(bool value) {
    _sideOneServer = value;
  }

  bool _positionRightServer = true;

  bool get positionRightServer => _positionRightServer;

  set positionRightServer(bool value) {
    _positionRightServer = value;
  }

  bool _firstServer = false;

  bool get firstServer => _firstServer;

  set firstServer(bool value) {
    _firstServer = value;
  }

  void incrementScore1() {
    score1++;
  }

  void incrementScore3() {
    score3++;
  }

  bool over() {
    return (score1 > 10) || (score3 > 10);
  }

  void reset() {
    score1 = score3 = 0;
    sideOneServer = true;
    positionRightServer = true; // position of the
    firstServer = false;
  }
}
