import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/question_controller.dart';

class SecondPage extends StatelessWidget {
  SecondPage({super.key});
  final QustionController controller = Get.put(QustionController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(()=>Text("Your score is: ${controller.score.value}")),
      ),
    );
  }
}
