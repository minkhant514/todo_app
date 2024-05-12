import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/getx/dynamic_theme.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("GetX Tutorial"),
        centerTitle: true,
        actions: const [
          DynamicThemeIcon(),
          SizedBox(
            width: 20,
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /// value form  name route
            // Text(Get.parameters["para"] ?? "Null"),

            ///value form no name route
            Text("${Get.arguments}"),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton(
              onPressed: () {},
              child: const Text("Show BottomSheet"),
            ),
          ],
        ),
      ),
    );
  }
}
