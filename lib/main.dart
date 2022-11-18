import 'dart:async';
import 'package:flutter_tts/flutter_tts.dart';
import 'package:flutter/material.dart';
// import 'package:liquid_swipe/liquid_swipe.dart';
import 'dart:math';

void main() {
  runApp(const RootWidget());
}

class RootWidget extends StatelessWidget {
  const RootWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(body: HeaderWidget()),
    );
  }
}

class HeaderWidget extends StatefulWidget {
  const HeaderWidget({super.key});

  // @override
  // _HeaderWidgetState createState() => _HeaderWidgetState();
  // const HeaderWidget({super.key});
  @override
  State<HeaderWidget> createState() => _HeaderWidgetState();
}

class _HeaderWidgetState extends State<HeaderWidget> {
  String txt = "";
  var rand = Random();

  FlutterTts flutterTts = FlutterTts();

  // void _speak(t) async {
  //   await flutterTts.speak(t);
  // }

  // void _stop() async {
  //   await flutterTts.stop();
  // }

  @override
  void initState() {
    // txt = "you haven't clicked yet !";
    txt = rand.nextInt(100).toString();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Speak(String text) async {
      await flutterTts.setLanguage("en-US");
      await flutterTts.setPitch(2);
      await flutterTts.speak(text);
    }

    double screenH = MediaQuery.of(context).size.height;
    double sceenW = MediaQuery.of(context).size.width;

    return Container(
      height: screenH / 2,
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20)),
          color: Color.fromARGB(255, 255, 255, 255),
          boxShadow: [
            BoxShadow(
              color: Color.fromARGB(150, 15, 12, 12),
              offset: Offset(
                0.0,
                0.0,
              ),
              blurRadius: 50.0,
              spreadRadius: 2.0,
            ),
          ]),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Text("Hello Sabbir, $txt"),
            CircleWidget(
                circleHeight: screenH / 4,
                circleWidth: screenH / 4,
                childWidget: Center(
                  child: Text(
                    txt,
                    style: const TextStyle(
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                        fontSize: 50),
                  ),
                ),
                circleRadius: 100.00),
            // Text(txt),
            const Padding(padding: EdgeInsets.all(10.00)),
            Row(
              children: [
                Container(
                  width: sceenW / 3,
                  child: const Center(child: Text("Corrects ")),
                ),
                Container(
                  width: sceenW / 3,
                  child: const Center(child: Text("Mistakes ")),
                ),
                Container(
                  width: sceenW / 3,
                  child: const Center(child: Text("Times ")),
                ),
              ],
            ),
            const Padding(padding: EdgeInsets.all(10.00)),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // txt = "You have clicked";
                  txt = rand.nextInt(100).toString();
                });
                // _speak("hello sabbir how are you?");
                Speak(txt);
              },
              child: const Text("Click me"),
            ),
          ],
        ),
      ),
    );
  }
}

class CircleWidget extends StatelessWidget {
  final double circleHeight;
  final double circleWidth;
  final double circleRadius;
  final Widget childWidget;
  const CircleWidget(
      {super.key,
      required this.circleHeight,
      required this.circleWidth,
      required this.circleRadius,
      required this.childWidget});
  // void CircleWidget(this.circleHeight,this.circleWidth,this.child);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: circleHeight,
      width: circleWidth,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(circleRadius),
          border: Border.all(
              color: Colors.black87,
              width: 2.0,
              style: BorderStyle.solid,
              strokeAlign: StrokeAlign.inside)),
      child: childWidget,
    );
  }
}

// var random = new Random();
// //random with minimum value of 10

// int randomNumber; // from 10 upto 99 included

// Future<String> rNumber() async {
//   return "sabbir";
// }
