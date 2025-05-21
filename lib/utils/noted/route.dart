/*

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

     -----------------------------------------
    
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


*/
/// TODO: home page ui
// Center(
//         child: Column(
//           mainAxisSize: MainAxisSize.min,
//           mainAxisAlignment: MainAxisAlignment.center,
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             /// value form  name route
//             // Text(Get.parameters["para"] ?? "Null"),

//             ///value form no name route
//             Text("${Get.arguments}"),
//             const SizedBox(
//               height: 20,
//             ),
//             ElevatedButton(
//               onPressed: () {},
//               child: const Text("Show BottomSheet"),
//             ),
//           ],
//         ),
//       )


/// TODO: Next Page Ui
//  Center(
//         child: Column(
//           children: [
//             Text(Get.parameters["somePara"] ?? "Null"),
//           ],
//         ),
//       )