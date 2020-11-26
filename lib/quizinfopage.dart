import 'package:flutter/material.dart';
import 'package:quiz_app/homepage.dart';
import 'package:quiz_app/t_or_f.dart';
import 'package:quiz_app/text.dart';

// ignore: must_be_immutable
class QuizInfoPage extends StatelessWidget {
  String title;
  QuizInfoPage({this.title});
  @override
  Widget build(BuildContext context) {
    Size size =MediaQuery.of(context).size;
    List<Widget> chil = [];
    return Scaffold(
      backgroundColor: Colors.grey[800],
      body: ListView(
        children: [
          // SliverAppBar(
          //   leading: IconButton(
          //     icon: Icon(Icons.arrow_back),
          //     onPressed: () {},
          //   ),
          //   title: Text(title),
          //   shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.only(
          //       bottomLeft: Radius.circular(30.0),
          //       bottomRight: Radius.circular(30.0),
          //     ),
          //   ),
          //   centerTitle: true,
          // ),
          // SliverList(
          //   delegate: SliverChildListDelegate(chil),
          // ),
          Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(30.0),
                bottomLeft: Radius.circular(30.0)
              ),
              color: Colors.yellow[300]
            ),
            height: size.height*0.35,
            child: Stack(
              children: [
                IconButton(icon: Icon(Icons.arrow_back), onPressed: (){
                  Navigator.pop(context);
                }),
                Center(child: Text(title,style: TextStyle(fontSize: 50.0),)),
                //NetworkImage(url)
              ],
            ),
          ),
          SizedBox(height: size.height*0.05,),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:25.0),
            child: fillText,
          ),
          SizedBox(height: size.height*0.14,),
          Container(
            alignment: Alignment.bottomCenter,
            height: size.height * 0.15,
            decoration: BoxDecoration(
              color: Colors.yellow[300],
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
                      'Start Quiz',
                      style: TextStyle(fontSize: 20.0, color: Colors.white),
                    ),
                  ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        // builder: (context) => TorFQuiz(
                        //   index: 0,
                        //   correct_ans: 0,
                        // ),
                        builder: (context)=>TorFQuiz(index: 0,correct_ans: 0,)
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
