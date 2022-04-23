import 'package:flutter/material.dart';
import 'ui/colors.dart';
import 'logic/game.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.green,
      ),
      home: const GameScreen(),
    );
  }
}

class GameScreen extends StatefulWidget {
  const GameScreen({Key? key}) : super(key: key);

  @override
  _GameScreen createState() => _GameScreen();
}

class _GameScreen extends State<GameScreen> {
  List<int> scoreboard = [0, 0, 0, 0, 0, 0, 0, 0, 0];
  int player = 0;
  String playerTurn = "X";
  String result = "";
  int counter = 0;
  bool gameOver = false;

  Game game = Game();
  void initState() {
    super.initState();
    game.board = Game.InitBoard();
    print(game.board);
  }

  @override
  Widget build(BuildContext context) {
    double boardWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        title: Text("TICTACTOE"),
      ),
      backgroundColor: MainColor.background,
      body: Center(
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(gameOver ? result : "${playerTurn}'s Turn!".toUpperCase(),
                  style:
                  TextStyle(color: Colors.white, fontSize: FontSize.large)),
              Container(
                  width: boardWidth,
                  height: boardWidth,
                  child: GridView.count(
                      crossAxisCount: Game.boardLength ~/ 3,
                      padding: EdgeInsets.all(16.0),
                      mainAxisSpacing: 8.0,
                      crossAxisSpacing: 8.0,
                      children: List.generate(Game.boardLength, (index) {
                        return InkWell(
                            onTap: () {
                              if (game.board![index] == "") {
                                setState(() {
                                  game.board![index] = playerTurn;
                                  counter++;
                                  gameOver = game.checkWinner(
                                      playerTurn, index, scoreboard);

                                  if (gameOver) {
                                    result = "$playerTurn Won!";
                                  } else if (!gameOver && counter > 8) {
                                    result = "Its a tie";
                                    gameOver = true;
                                  }
                                  if (playerTurn == "X") {
                                    playerTurn = "O";
                                  } else {
                                    playerTurn = "X";
                                  }
                                });
                              }
                            },
                            child: Container(
                              width: 200, //TODO - setja í breytu
                              height: 200, //TODO - setja í breytu
                              decoration: BoxDecoration(
                                color: MainColor.white,
                                borderRadius: BorderRadius.circular(16.0),
                              ),
                              child: Center(
                                child: Text(game.board![index].toString(),
                                    style: TextStyle(
                                        color: game.board![index] == "X"
                                            ? MainColor.x
                                            : MainColor.o,
                                        fontSize: FontSize.large)),
                              ),
                            ));
                      }))),
              ElevatedButton.icon(
                onPressed: () {
                  setState(() {
                    game.board = Game.InitBoard();
                    gameOver = false;
                    counter = 0;
                    playerTurn = "X";
                    result = "";
                    scoreboard = [0, 0, 0, 0, 0, 0, 0, 0, 0];
                  });
                },
                icon: Icon(Icons.replay),
                label: Text('Repeat game'),
              )
            ]),
      ),
    );
  }
}
