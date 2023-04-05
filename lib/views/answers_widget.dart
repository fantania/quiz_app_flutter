import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/question_controller.dart';
import '../data/qestions_list.dart';

class AnswersWidget extends StatelessWidget {
  //final String? question;
  final String? answer;
  AnswersWidget({super.key, this.answer});
  final QustionController controller = Get.put(QustionController());

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      //onTap: controller.checkAnswer(answer.toString()),
      onTap: () {
        // if (answer ==
        //     questionList[controller.questionIndex]["correct_answer"]) {
        //   controller.incrementScore();
        // }
        controller.checkAnswer(answer.toString());
      },
      child: Container(
        margin: const EdgeInsets.all(20),
        padding: const EdgeInsets.all(10),
        width: Get.width/3,
        height:Get.height/10,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          color: Colors.blue[400],
        ),
        child: Center(
            child: Text(
          answer.toString(),
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        )),
      ),
    );
  }
}
