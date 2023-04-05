import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'controller/business_logic.dart';
import 'controller/question_controller.dart';
import 'data/qestions_list.dart';
import 'views/answers_widget.dart';
import 'views/second_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Quiz App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final QustionController controller = Get.put(QustionController());
  int _questionIndex = 0;
  int _score = 0;

  void _incrementIndex() {
    if (_questionIndex < 8) {
      setState(() {
        _questionIndex++;
      });
    } else {
      Get.to(SecondPage());
    }
  }

  @override
  Widget build(BuildContext context) {
    List<String> answers = [];
    if (_questionIndex < 8) {
      answers = BusinessLogic.creatAnswersList(_questionIndex);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text("Quiz App"),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Obx(
            () => Text(
              "The Score: ${controller.score.value}",
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "${questionList[_questionIndex]["question"]}",
            style: const TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnswersWidget(answer: answers[0]),
              AnswersWidget(answer: answers[1]),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AnswersWidget(answer: answers[2]),
              AnswersWidget(answer: answers[3]),
            ],
          ),
          GestureDetector(
            onTap: _incrementIndex,
            child: Container(
              margin: const EdgeInsets.all(20),
              padding: const EdgeInsets.all(10),
              width: 300,
              height: 150,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Colors.blue[400],
              ),
              child: const Center(
                  child: Text(
                "Next",
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                ),
              )),
            ),
          ),
        ],
      ),
    );
  }
}
