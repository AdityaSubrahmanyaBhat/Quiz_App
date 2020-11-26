import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/quizinfopage.dart';
import 't_or_f.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        '/home': (context) => TorFQuiz(
              index: 0,
              correct_ans: 0,
            ),
      },
      home: Splash(),
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer(Duration(seconds: 4), () {
      Navigator.push(
        context,
        MaterialPageRoute(
          // builder: (context) => TorFQuiz(
          //   index: 0,
          //   correct_ans: 0,
          // ),
          //builder: (context)=>QuizInfoPage(title: 'QuizInfoPage',)
            builder: (context)=>HomePage()
        ),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            TyperAnimatedTextKit(
              text: ['QUIZ'],
              textStyle: TextStyle(fontSize: 30.0, color: Colors.white),
              speed: Duration(milliseconds: 750),
            ),
            SizedBox(
              height: 20.0,
            ),
            SpinKitWave(
              size: 60.0,
              itemBuilder: (context, int num) {
                return DecoratedBox(
                  decoration: BoxDecoration(color: Colors.white),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
