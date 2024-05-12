import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/ui/home_page.dart';
import 'package:getx_tutorial/ui/next_page.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// todo:  implement for using getx
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.from(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.cyan,
        ),
      ),
      initialRoute: "/",
      getPages: [
        GetPage(
          name: "/",
          page: () => const MyApp(),
        ),

        GetPage(
          name: "/home",
          page: () => const HomePage(),
          transition: Transition.fadeIn,
          curve: Curves.fastOutSlowIn,
        ),

        /// you can pre define parameter to next screen like this
        GetPage(
          name: "/next/:somePara",
          page: () => const NextPage(),
        ),
      ],
      home: bodyContent(),
    );
  }

  Widget bodyContent() {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ElevatedButton(
              onPressed: () {
                /* GetX route with no name */

                Get.to(
                  () => const HomePage(),
                  arguments: "Hello Flutter",
                  transition: Transition.fadeIn,
                  curve: Curves.fastOutSlowIn,
                  duration: const Duration(
                    milliseconds: 1200,
                  ),
                );

                /* GetX route with  name // warmming: can't use Duration  */

                /// can post some value as parameter like this
                // Get.toNamed("/home?para=GetXRouteTutorial");
              },
              child: const Text("Go To Home"),
            ),
            ElevatedButton(
              onPressed: () {
                Get.toNamed("/next/HelloGetX");
              },
              child: const Text("Go To Next"),
            ),
          ],
        ),
      ),
    );
  }
}
