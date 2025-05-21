import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../const/string.dart';
import '../persistent/dao/theme_dao/theme_dao.dart';
import '../persistent/dao/theme_dao/theme_dao_impl.dart';
import '../../utils/helper/notify_helper.dart';

class ThemeController extends GetxController {
  late NotifyHelper notifyHelper;
  DateTime _dateTime = DateTime.now();
  var isDarkMode = false.obs;
  ThemeDao themeDao = ThemeDaoImple();

  DateTime get dateTime => _dateTime;

  ThemeController() {
    isDarkMode.value = themeDao.getTheme() ?? false;
    notifyHelper = NotifyHelper();
    notifyHelper.requestAndroidPermissions();
  }

  void toggleTheme() {
    Get.closeCurrentSnackbar();
    isDarkMode.value = !isDarkMode.value;
    debugPrint("isDarkMode =>${isDarkMode.value}");
    isDarkMode.value
        ? Get.changeThemeMode(
            ThemeMode.dark,
          )
        : Get.changeThemeMode(
            ThemeMode.light,
          );
    showSnapbar();
    themeDao.saveTheme(isDarkMode.value);
  }

  showSnapbar() {
    return Get.snackbar(
      kNotifyText,
      isDarkMode.value ? kActivatedDarkModeText : kActivatedLightModeText,
      icon: Image.asset("images/todo_logo.png"),
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.all(16),
      isDismissible: true,
      dismissDirection: DismissDirection.horizontal,
      colorText: isDarkMode.value ? Colors.black : Colors.white,
      backgroundColor: isDarkMode.value ? Colors.white : Colors.black,
    );
  }

  ThemeMode get theme => isDarkMode.value ? ThemeMode.dark : ThemeMode.light;

  void cleanUpMethod() {
    debugPrint("my controller was disposed");
  }
}




/*
 * Create Instance for Controller 
 * UserController userController = Get.put(UserController());
 *            OR
 * use GetX<UserController>() inside of widget tree
 */
