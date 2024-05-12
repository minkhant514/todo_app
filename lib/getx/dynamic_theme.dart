import 'package:flutter/material.dart';
import 'package:get/get.dart';

// buttom sheet with dynamic theme(light and dark) with GetX

class DynamicThemeIcon extends StatelessWidget {
  const DynamicThemeIcon({super.key});

  @override
  Widget build(BuildContext context) {
    final darkMode = Theme.of(context).brightness == Brightness.dark;
    return IconButton(
      onPressed: () {
        Get.bottomSheet(
          backgroundColor: darkMode ? Colors.white : Colors.black,
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(16),
              topRight: Radius.circular(16),
            ),
          ),
          Container(
            padding: const EdgeInsets.all(16),
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.3,
            decoration: const BoxDecoration(),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton.icon(
                  icon: const Icon(Icons.light_mode_outlined),
                  onPressed: () {
                    Get.changeTheme(ThemeData.light());
                    Get.back();
                  },
                  label: const Text("Light Theme"),
                ),
                OutlinedButton.icon(
                  icon: const Icon(Icons.dark_mode_rounded),
                  onPressed: () {
                    Get.changeTheme(ThemeData.dark());
                    Get.back();
                  },
                  label: const Text("Dark Theme"),
                ),
              ],
            ),
          ),
        );
      },
      icon: const Icon(Icons.color_lens),
    );
  }
}
