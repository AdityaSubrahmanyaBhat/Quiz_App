import 'package:flutter/material.dart';
import 'package:quiz_app/questionlist.dart';
import 'package:quiz_app/result.dart';

// ignore: must_be_immutable
class TorFQuiz extends StatefulWidget {
  // ignore: non_constant_identifier_names
  int index, correct_ans;
  // ignore: non_constant_identifier_names
  TorFQuiz({this.index, this.correct_ans});
  @override
  _TorFQuizState createState() => _TorFQuizState();
}

class _TorFQuizState extends State<TorFQuiz> {
  void right() {
    setState(() {
      widget.correct_ans++;
      widget.index++;
      print('correct');
      if (widget.index == 9) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => Result(
              score: widget.correct_ans,
            ),
          ),
        );
      }
    });
  }

  void wrong() {
    setState(() {
      widget.index++;
      print('wrong');
      if (widget.index == 9) {
        print(widget.correct_ans);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => Result(
              score: widget.correct_ans + 1,
            ),
          ),
        );
      }
    });
  }

  Questionlist instance = Questionlist();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: Colors.grey[900],
      body: ListView(
        children: [
          Container(
            height: size.height * 0.5,
            decoration: BoxDecoration(
                color: Colors.yellow[300],
                borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(30.0),
                    bottomRight: Radius.circular(30.0))),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25.0),
              child: ListView(
                children: [
                  // Container(
                  //   child: IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                  //     Navigator.of(context).pop();
                  //   }),
                  //   //alignment: Alignment.topLeft,
                  //   margin: EdgeInsets.only(left: 10.0),
                  // ),
                  Padding(
                    padding: const EdgeInsets.only(top: 80.0),
                    child: Text(
                      '${widget.index + 1}. ${instance.questionlist[widget.index]['question']}',
                      style: TextStyle(color: Colors.black, fontSize: 30.0),
                    ),
                  ),
                  SizedBox(
                    height: size.height * 0.06,
                  ),
                  buildRaisedButton('True'),
                  SizedBox(
                    height: size.height * 0.05,
                  ),
                  buildRaisedButton('False'),
                ],
              ),
            ),
          ),
          // Padding(
          //   padding: EdgeInsets.only(top: 300.0,left: 70.0,right: 70.0),
          //   child: buildRaisedButton('Skip'),
          // )
        ],
      ),
    );
  }

  RaisedButton buildRaisedButton(String text) {
    return RaisedButton(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(30.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 15.0),
        child: Text(
          text,
          style: TextStyle(fontSize: 20.0),
        ),
      ),
      onPressed: () {
        if(text=='Skip')
          {
            setState(() {
              widget.index++;
            });
          }
        else if (instance.questionlist[widget.index]['answer'] == text) {
          right();
        } else {
          wrong();
        }
      },
    );
  }
}
