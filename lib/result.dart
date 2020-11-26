import 'package:flutter/material.dart';
import 'package:percent_indicator/circular_percent_indicator.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/t_or_f.dart';

// ignore: must_be_immutable
class Result extends StatelessWidget {
  int score;
  Result({this.score});
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: ListView(
        children: [
          Container(
            height: size.height * 0.45,
            decoration: BoxDecoration(
              color: Colors.yellow[200],
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(40.0),
                bottomRight: Radius.circular(40.0),
              ),
            ),
            child: Column(
              children: [
                Container(
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>HomePage()));
                    },
                  ),
                  alignment: Alignment.topLeft,
                ),
                // SizedBox(
                //   height: size.height * 0.05,
                // ),
                Text(
                  'Your Score',
                  style: TextStyle(fontSize: 40.0),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Container(
                  alignment: Alignment.center,
                  child: CircularPercentIndicator(
                    radius: 170.0,
                    percent: score / 10,
                    backgroundColor: Colors.black,
                    progressColor: score >= 5 ? Colors.green : Colors.red,
                    lineWidth: 5.0,
                    center: Text(
                      '$score.0',
                      style: TextStyle(fontSize: 60.0),
                    ),
                  ),
                ),
                SizedBox(
                  height: size.height * 0.05,
                ),
                Text(
                  score >= 5
                      ? score >= 8
                          ? 'Excellent!!'
                          : 'Well Done!'
                      : 'Better luck next time',
                  style: TextStyle(fontSize: 30.0),
                )
              ],
            ),
          ),
          SizedBox(
            height: size.height * 0.37,
          ),
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.yellow[200],
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(40.0),
                topRight: Radius.circular(40.0),
              ),
            ),
            child: Container(
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: RaisedButton(
                  color: Colors.grey[800],
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30.0)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 40.0, vertical: 10.0),
                    child: Text(
                      'Try Again',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => TorFQuiz(
                          index: 0,
                          correct_ans: 0,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
