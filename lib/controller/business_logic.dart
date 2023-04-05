import 'dart:math';

import 'package:quiz_app/data/qestions_list.dart';

import 'question_controller.dart';

class BusinessLogic {
  static int createRandomNumber(int max) {
    var rndm = Random();
    return rndm.nextInt(max);
  }

  static List<String> creatAnswersList(int questionIndex) {
    List<String>? answList = ["", "", "", ""];

    List<int> indexes = List<int>.generate(4, (index) => index);
    indexes.shuffle();
    answList[indexes[0]] = questionList[questionIndex]["correct_answer"];

    for (int i = 0; i < 3; i++) {
      answList[indexes[i + 1]] =
          questionList[questionIndex]["incorrect_answers"][i];
    }
    return answList;
  }
}
