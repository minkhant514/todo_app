import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/const/dimens.dart';
import 'package:getx_tutorial/controller/theme_controller.dart';



class DynamicThemeIcon extends StatefulWidget {
  const DynamicThemeIcon({
    super.key,
  });

  @override
  State<DynamicThemeIcon> createState() => _DynamicThemeIconState();
}

class _DynamicThemeIconState extends State<DynamicThemeIcon> {
  @override
  Widget build(BuildContext context) {
    final ThemeController controller = Get.put(ThemeController());
    return Padding(
      padding: const EdgeInsets.all(kDefaultPadding),
      child: Obx(() => GestureDetector(
            onTap: () {
              controller.toggleTheme();
            },
            child: AnimatedCrossFade(
              firstChild: Icon(
                size: 28,
                Icons.dark_mode_outlined,
              ),
              secondChild: Icon(
                size: 28,
                Icons.light_mode,
              ),
              crossFadeState: controller.isDarkMode.value
                  ? CrossFadeState.showFirst
                  : CrossFadeState.showSecond,
              duration: const Duration(milliseconds: 700),
            ),
          )),
    );
  }
}
