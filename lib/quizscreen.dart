import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:simplequiz/questionmodel.dart';
import 'questionmodel.dart';

class quizscreen extends StatefulWidget {
  const quizscreen({super.key});

  @override
  State<quizscreen> createState() => _quizscreenState();
}

class _quizscreenState extends State<quizscreen> {
  List<Question> questionList = getQuestion();
  int currentQuestionIndex = 0;
  int score = 0;
  Answer? selectedAnswer;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 5, 50, 80),
        body: Container(
            child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(15.0),
              child: Text(
                'नेपाली समान्य ज्ञान App',
                style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 25),
              ),
            ),
            _questionWidget(),
            _answerList(),
            _nextButton(),
          ],
        )),
      ),
    );
  }

  _questionWidget() {
    return Column(
      children: [
        Text(
          'Question ${currentQuestionIndex + 1}/${questionList.length.toString()}',
          style: TextStyle(
              color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
        ),
        SizedBox(
          height: 20,
        ),
        Container(
          padding: EdgeInsets.all(50),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              color: Colors.redAccent, borderRadius: BorderRadius.circular(19)),
          width: double.infinity,
          child: Text(
            questionList[currentQuestionIndex].questionText,
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.w800, fontSize: 18),
          ),
        )
      ],
    );
  }

  _answerList() {
    return Column(
      children: questionList[currentQuestionIndex]
          .answersList
          .map(
            (e) => _answerButton(e),
          )
          .toList(),
    );
  }

  Widget _answerButton(Answer answer) {
    bool isSelected = answer == selectedAnswer;
    return Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(vertical: 16),
        width: double.infinity,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: isSelected ? Colors.purpleAccent : Colors.black26,
              onPrimary: isSelected ? Colors.black26 : Colors.black),
          child: Text(
            answer.answerText,
            style: TextStyle(color: Colors.white, fontSize: 25),
          ),
          onPressed: () {
            if (selectedAnswer == null) {
              if (answer.isCorrect) {
                score++;
              }
            }
            setState(() {
              selectedAnswer = answer;
            });
          },
        ));
  }

  _nextButton() {
    bool isLastQuestion = false;

    if (currentQuestionIndex == questionList.length - 1) {
      isLastQuestion = true;
    }
    return Container(
        decoration: BoxDecoration(
            color: Colors.black12, borderRadius: BorderRadius.circular(20)),
        margin: EdgeInsets.symmetric(vertical: 16),
        width: MediaQuery.of(context).size.width * 0.6,
        height: 55,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
              primary: Colors.red, onPrimary: Colors.black),
          child: Text(
            isLastQuestion ? "Submit" : "Next",
            style: TextStyle(color: Colors.black, fontSize: 25),
          ),
          onPressed: () {
            if (isLastQuestion) {
              showDialog(context: context, builder: (_) => _showScoreAlert());
              //Display the Score
            } else {
              setState(() {
                selectedAnswer = null;
                currentQuestionIndex++;
              });
              //Next Question

            }
          },
        ));
  }

  _showScoreAlert() {
    bool isPassed = false;
    if (score >= questionList.length * 50) {
      isPassed = true;
    }

    String title = isPassed ? "Passed" : "Failed";
    return AlertDialog(
      title: Text("Your Score is $score",
          style: TextStyle(color: Colors.deepOrange)),
      content: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.black54,
        ),
        child: Text(
          'Restart',
          style: TextStyle(fontSize: 20),
        ),
        onPressed: () {
          setState(() {
            Navigator.pop(context);
            currentQuestionIndex = 0;
            score = 0;
            selectedAnswer = null;
          });
        },
      ),
    );
  }
}
