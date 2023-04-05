import 'package:get/get.dart';

import '../data/qestions_list.dart';

class QustionController extends GetxController {
  var score = 0.obs;

  final _questionIndex = 0.obs;
  get questionIndex => _questionIndex;

  final _question = "".obs;
  get question => _question;

  final _listAnswers = [].obs;
  get listAnswers => _listAnswers;

  void incrementScore() {
    score.value++;
  }

  void updateQuestion(String questionUpdate) {
    _question.value = questionUpdate;
  }

  updateAnswers(List<String> answersUpdated) {
    _listAnswers.value = answersUpdated;
    print("list in controler $_listAnswers");
    return _listAnswers;
  }

  void nextQuestion() {
    _questionIndex.value++;
  }

  checkAnswer(String givenAnswer) {
    if (givenAnswer == questionList[_questionIndex.value]["correct_answer"]) {
      incrementScore();
    }
  }
}
