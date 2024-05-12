import 'package:flutter/material.dart';
import 'package:get/get.dart';

class NextPage extends StatelessWidget {
  const NextPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Next Screen"),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            Text(Get.parameters["somePara"] ?? "Null"),
          ],
        ),
      ),
    );
  }
}
