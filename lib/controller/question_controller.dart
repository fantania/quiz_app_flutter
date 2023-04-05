import 'package:get/get.dart';

import '../data/qestions_list.dart';

class QustionController extends GetxController {
  var score = 0.obs;

  final questionIndex = 0.obs;
  // get questionIndex => _questionIndex;

  final question = "".obs;
  // get question => _question;

  final listAnswers = [].obs;
  // get listAnswers => _listAnswers;

  void incrementScore() {
    score.value++;
  }

  void updateQuestion(String questionUpdate) {
    question.value = questionUpdate;
  }

  updateAnswers(List<String> answersUpdated) {
    listAnswers.value = answersUpdated;
    print("list in controler $listAnswers");
    return listAnswers;
  }

  void nextQuestion() {
    questionIndex.value++;
  }

  checkAnswer(String givenAnswer) {
    print(givenAnswer);
    print(questionList[questionIndex.value]["correct_answer"]);
    if (givenAnswer == questionList[questionIndex.value]["correct_answer"]) {
      incrementScore();
    }
  }
}
