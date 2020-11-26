import 'package:flutter/material.dart';
import 'package:quiz_app/quizinfopage.dart';
import 'package:quiz_app/t_or_f.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // appBar: AppBar(
      //   leading: IconButton(icon: Icon(Icons.arrow_back),onPressed: (){Navigator.pop(context);},),
      // ),
      body: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
              height: size.height,
              width: size.width,
              child: Text(''),
              decoration: BoxDecoration(color: Colors.grey[800])),
          Container(
              margin: EdgeInsets.only(top: size.height * 0.35),
              //alignment: Alignment.bottomCenter,
              height: size.height * 0.612,
              width: size.width,
              decoration: BoxDecoration(
                color: Colors.yellow[300],
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(40.0),
                  topRight: Radius.circular(40.0),
                ),
              ),
              child: Text('')),
          Padding(
            padding: const EdgeInsets.only(left:30.0,right: 25.0,bottom:100.0),
            child: Row(
              children: [
                buildGestureDetector(context, size,'Quiz 3'),
                SizedBox(width: size.width*0.15,),
                buildGestureDetector(context, size,'Quiz 4'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left:30.0,right: 25.0,bottom:300.0),
            child: Row(
              children: [
                buildGestureDetector(context, size,'Quiz 1'),
                SizedBox(width: size.width*0.15,),
                buildGestureDetector(context, size,'Quiz 2'),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 700.0),
            child: Text(
              'QUIZ',
              style: TextStyle(fontSize: 60.0,color: Colors.yellow),
            ),
          ),
        ],
      ),
    );
  }

  GestureDetector buildGestureDetector(BuildContext context, Size size,String title) {
    return GestureDetector(
                onTap: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>QuizInfoPage(title: title,)));
                },
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(30.0),
                  ),
                  height: size.height * 0.15,
                  width: size.width * 0.35,
                  child: Card(
                    color: Colors.grey[800],
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30.0)),
                    child: Center(
                        child: Text(
                      title,
                      style: TextStyle(color: Colors.white, fontSize: 30.0),
                    )),
                  ),
                ),
              );
  }
}
