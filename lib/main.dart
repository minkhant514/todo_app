import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/const/hive_constant.dart';
import 'package:getx_tutorial/controller/theme_controller.dart';
import 'package:getx_tutorial/ui/pages/home_page.dart';
import 'package:getx_tutorial/utils/helper/theme_helper.dart';
import 'package:hive_flutter/adapters.dart';

import 'utils/helper/notify_helper.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotifyHelper().initializeNotification();
  await Hive.initFlutter();
  await Hive.openBox<bool>(kThemeBox);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    /// todo:  implement for using get x
    final ThemeController _controller = Get.put(
      ThemeController(),
    );
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeHelper.lightTheme,
      darkTheme: ThemeHelper.darkTheme,
      themeMode: _controller.theme,
      home: const HomePage(),
    );
  }
}
