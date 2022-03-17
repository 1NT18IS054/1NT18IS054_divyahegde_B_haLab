import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz/question.dart';


class Questions{
  List<Question> questionBank = [
    Question(questionText: "Question1", answer: true),
    Question(questionText: "Question2", answer: true),
    Question(questionText: "Question3", answer: true),
    Question(questionText: "Question4", answer: true),
    Question(questionText: "Question5", answer: true),
    Question(questionText: "Question6", answer: true),
    Question(questionText: "Question7", answer: true),

  ];
}

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: SafeArea(
        child: Scaffold(
          body: Quiz(),
        ),

      ),
    );
  }
}

class Quiz extends StatefulWidget {
  const Quiz({Key? key}) : super(key: key);

  @override
  _QuizState createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Center(
            child: Text(
              checkQNumber(questionNumber)?
                  questions.questionBank[questionNumber].questionText.toString():
                  "End",
              style: TextStyle(
                fontSize: 40.0,
              ),
            ),

          ),
          SizedBox( height: 50.0,),
          if(checkQNumber(questionNumber))
            ElevatedButton(
              onPressed: (){
                setState(() {
                  if(questionNumber == questions.questionBank.length){
                    print("End of questions");

                  }
                  else{
                    updateScore(true, questionNumber);
                    updateQNumber();
                  }
                });

              },
              child: Text(
                "True",
                style: TextStyle(
                  fontSize: 30.0,
                ),

              )
          ),
          SizedBox( height: 20.0,),
          if(checkQNumber(questionNumber))
          ElevatedButton(
              onPressed: (){
                setState(() {
                  if(questionNumber == questions.questionBank.length){
                    print("End of questions");

                  }
                  else{
                    updateScore(false, questionNumber);
                    updateQNumber();
                  }
                });

              },
              child: Text(
                "False",
                style: TextStyle(
                  fontSize: 30.0,
                ),

              )
          ),

          SizedBox(height: 100.0,),


          Padding(
              padding: EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                "Current Score"
    ,style: TextStyle(
    fontSize: 30.0,
    ),
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(30.0),
            child: Center(
              child: Text(
                  "$currentScore"
                ,style: TextStyle(
                fontSize: 30.0,
              ),

              ),
            ),
          )

        ],
      )
    );
  }


  int questionNumber = 0;
  int currentScore = 0;

  Questions questions = Questions();

  void updateQNumber(){

    setState(() {
      questionNumber++;
      print("$questionNumber");
    });

  }

  void updateScore(bool choice, int qNumber){
    if(questions.questionBank.length == qNumber){
      print("End of questions");
    }
    if( questions.questionBank[qNumber].answer == choice){
      setState(() {
        currentScore++;
      });
    }

  }

  bool checkQNumber(int questionNumber){
    return (questionNumber < questions.questionBank.length)? true: false;
  }

 

}
