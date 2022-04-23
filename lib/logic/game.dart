class Player {
  static const x = "X";
  static const o = "O";
  static const empty = "";
}

class Game {
  static final boardLength = 9;
  List<String>? board;
  static List<String> InitBoard() =>
      List.generate(boardLength, (index) => Player.empty);

  bool checkWinner(String playerTurn, int index, List<int> scoreboard) {
    //Lengdin á columns
    int colLength = 3;
    // Row staðsettning
    int row = index ~/ colLength;
    // Lengd staðsettning
    int col = index % colLength;
    // Hvor er að gera?
    int score = playerTurn == "X" ? 1 : -1;
    //Bæta við á staðsettningu í Array.
    scoreboard[row] += score;
    //Bæta við, telst sem stig ef það lendir á 6 fyrir "beinan sigur", 7 fyrir "skásigur"
    scoreboard[colLength + col] += score;
    // Til þess að finna hornin og miðjuna.
    if (row == col) {
      scoreboard[6] += score;
    }
    // til þess að finna milli reitina.
    if (colLength - 1 - col == row) {
      scoreboard[7] += score;
    }
    if (scoreboard.contains(3) || scoreboard.contains(-3)) {
      return true;
    } else {
      return false;
    }
  }
}
