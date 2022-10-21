import 'package:flutter/material.dart';
import 'package:liquid_swipe/liquid_swipe.dart';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    var random = new Random();
    //random with minimum value of 10

    int randomNumber = random.nextInt(90) + 10; // from 10 upto 99 included
    // print("this is random number: ", randomNumber);

    final pages = [
      Container(
          color: Colors.green,
          child: AnimatedContainer(
              duration: Duration(microseconds: 300),
              child: SafeArea(
                child: Text(
                  randomNumber.toString(),
                  textScaleFactor: 80.00,
                ),
              ))),
      Container(
        color: Colors.red,
      ),
      Container(
        color: Colors.yellow,
      ),
      Container(
        color: Colors.blue,
      ),
    ];

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: LiquidSwipe(
          pages: pages,
        )));
  }
}
