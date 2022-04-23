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
      home: const MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _GameScreen();
}

class _GameScreen extends State<MyHomePage> {

  Game game = Game();

  void initState(){
    super.initState();
    //TODO - inititalize game board
    print('game');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      backgroundColor: MainColor.background,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              Container(
                width: 400, //TODO - setja í breytu
                height: 400, //TODO - setja í breytu
                child: GridView.count(
                  crossAxisCount: 9 ~/ 3, //TODO - setja í breytur
                  padding: EdgeInsets.all(16.0),
                  mainAxisSpacing: 8.0,
                  crossAxisSpacing: 8.0,
                  children: List.generate(9, (index) {
                    return InkWell(
                      child: Container(
                        width: 200, //TODO - setja í breytu
                        height: 200,//TODO - setja í breytu
                        decoration: BoxDecoration(
                          color: MainColor.white,
                          borderRadius: BorderRadius.circular(16.0),
                        ),
                      )
                    );
                  }

                )
                )
              ),
            ElevatedButton.icon(
              onPressed: () {
                //TODO - setState()
                /* setState(() {

                });*/
              },
              icon: Icon(Icons.replay),
              label: Text('Repeat game'),
            )
          ]
        ),

      ),
    );
  }
}

