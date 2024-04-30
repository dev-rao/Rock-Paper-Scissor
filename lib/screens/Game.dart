import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class Game extends StatefulWidget {
  const Game({super.key});

  @override
  State<Game> createState() => _GameState();
}

class _GameState extends State<Game> {
  String winner = "";

  play() {

  }

  reset() {
    setState(() {
      index1 = 0;
      index2 = 0;

      // widget.rScore = 0;
      // widget.lScore = 0;
    });
  }

  List team1 = [
    AssetImage("assets/paper.png"),
    AssetImage("assets/rock.png"),
    AssetImage("assets/scissor.png")
  ];
  List team2 = [
    AssetImage("assets/paper.png"),
    AssetImage("assets/rock.png"),
    AssetImage("assets/scissor.png")
  ];

  // var rnd = Icon(Icons.front_hand);
  int index1 = 0;
  int index2 = 0;
  int score = 11;
  int score1 = 0;
  int score2 = 0;

  final Random r = Random();

  randomImage() {
    return team1[index1];
  }

  randomImage1() {
    return team2[index2];
  }

  checkWinner() {


  }
  // void initState(){
  //   super.initState();
  //   SystemChrome.setPreferredOrientations([
  //     DeviceOrientation.landscapeRight,
  //     DeviceOrientation.landscapeLeft,
  //   ]);
  // }


  // Icon(IconData(r.nextInt(player1.length)));
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.tealAccent,
      body: Padding(
        padding: const EdgeInsets.only(top: 55),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(image: randomImage(),fit:BoxFit.contain
                    ), color: winner == "1" ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  height: Get.height*0.4,
                  width: Get.width*0.65,
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Text("Player",
                        style: TextStyle(
                            fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Text( "Win = "+
                        score1.toString(),
                      style: TextStyle(
                          fontSize: 25,fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: Text("Vs",style: TextStyle(
                color: Colors.black,
                fontSize: 25,
                fontWeight: FontWeight.bold,
              ),),
            ),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                        image:randomImage1(),fit:BoxFit.contain
                    ), color: winner == "2" ? Colors.green : Colors.red,
                    borderRadius: BorderRadius.circular(50),
                  ), height: Get.height*0.4,
                  width: Get.width*0.65,
                ),
                Column(
                  children: [
                    Container(
                      color: Colors.white,
                      child: Text("Com",
                        style: TextStyle(
                            fontSize: 25,fontWeight: FontWeight.bold),),
                    ),
                    Text( "Win = "+
                        score2.toString(),
                      style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(height: 15,),
            Padding(
              padding: const EdgeInsets.only(right: 100),
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                    primary: Colors.white
                ),
                onPressed: () {
                  setState(() {
                    Random random = new Random();
                    index1 = random.nextInt(3);
                    index2 = random.nextInt(3);
                    print("TEAM1=" + index1.toString());
                    print("TEAM2=" + index2.toString());

                    // 0 --> Paper
                    // 1 --> Rock
                    // 2 --> Scissor

                    if (index1 == 0) {
                      if (index2 == 0) {
                        winner = "draw";
                      } else if (index2 == 1) {
                        winner = "1";
                        score1++;
                      } else {
                        winner = "2";
                        score2++;
                      }
                    } else if (index1 == 1) {
                      if (index2 == 0) {
                        winner = "2";
                        score2++;
                      } else if (index2 == 1) {
                        winner = "draw";
                      } else {
                        winner = "1";
                        score1++;
                      }
                    } else {
                      if (index2 == 0) {
                        winner = "1";
                        score1++;
                      } else if (index2 == 1) {
                        winner = "2";
                        score2++;
                      } else {
                        winner = "draw";
                      }
                    }
                  }); if (score1==score){
                    showDialog(
                        context: context,
                        barrierDismissible: false,
                        // barrierColor: Colors.blueGrey,
                        builder: (ctx) => AlertDialog(
                          title: Text("Congratulations"),

                          content: Text("Player Winner = "+
                              score1.toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                              color: Colors.blue)
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                setState((){
                                  if (score1 <=11) {
                                    score1 = 0;
                                    score2 = 0;
                                  }else{
                                    score = score1;
                                  }
                                });
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                child: const Text("OK",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.blue)),
                              ),
                            ),
                          ],
                        ));

                  }
                  else if (score2==score){
                    showDialog(context: context,
                        barrierDismissible: false,
                        // barrierColor: Colors.blueGrey,
                        builder: (ctx) => AlertDialog(
                          title: Text("Congratulations"),

                          content: Text("Com Winner = "+
                              score2.toString(),
                              style: TextStyle(
                                  fontSize: 25,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue)
                          ),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () {
                                setState((){
                                  if (score2 <=11) {
                                    score2 = 0;
                                    score1 = 0;
                                  }else{

                                    score = score2;
                                  }
                                });
                                Navigator.of(ctx).pop();
                              },
                              child: Container(
                                child: Text("OK",style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.teal)),
                              ),
                            ),
                          ],
                        ));
                  }


                  print("Winner==" + winner.toString());
                },
                child: Text("Play",
                  style: TextStyle(color: Colors.black,fontSize: 18,fontWeight: FontWeight.bold),),
              ),
            )
          ],
        ),
      ),
    );
  }
}
