import 'package:getx_tutorial/const/hive_constant.dart';
import 'package:getx_tutorial/persistent/dao/theme_dao/theme_dao.dart';
import 'package:hive/hive.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

class ThemeDaoImple extends ThemeDao {
  ThemeDaoImple._();

  static final ThemeDaoImple _singleton = ThemeDaoImple._();

  factory ThemeDaoImple() => _singleton;

  @override
  void saveTheme(bool isDarkMode) => _themeBox().put(kThemeKey, isDarkMode);

  @override
  bool? getTheme() => _themeBox().get(kThemeKey, defaultValue: false);

  Box<bool> _themeBox() => Hive.box<bool>(kThemeBox);
}
