import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/add_task_controller.dart';

import '../../const/dimens.dart';
import '../../const/string.dart';
import '../../controller/theme_controller.dart';
import '../../widgets/dynamic_theme_icon.dart';
import '../../widgets/easy_text_widget.dart';
import '../view_items/home_page_view_items/home_page_task_list_items_view.dart';
import '../view_items/home_page_view_items/home_page_view_items.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ThemeController());
    Get.put(AddTaskController());
    return Scaffold(
      appBar: _appBar(),
      body: bodyContent(),
    );
  }

  /// app bar session
  AppBar _appBar() {
    return AppBar(
      leading: DynamicThemeIcon(),
      title: EasyTextWidget(
        text: KHeaderText,
        fontSize: 30,
        fontWeight: FontWeight.bold,
      ),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: () {
            Get.find<AddTaskController>().deleteAllTask();
          },
          icon: Icon(
            Icons.delete_outline,
          ),
          iconSize: kDefaultIconSize,
        ),
        const SizedBox(
          width: 20,
        ),
      ],
    );
  }

  /// body
  Widget bodyContent() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        // header( date time and add new task session )
        HomePageHeaderItemsView(),
        // date pick for show
        DatePickerItemsView(),
        // task list view session
        TaskListItemsView()
      ],
    );
  }
}
