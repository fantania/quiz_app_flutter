import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/question_controller.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  final QustionController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text("Your score is: ${controller.score}"),
    );
  }
}
