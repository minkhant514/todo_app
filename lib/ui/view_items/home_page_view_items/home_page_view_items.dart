import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:date_picker_timeline/date_picker_widget.dart';
import 'package:getx_tutorial/const/string.dart';
import 'package:getx_tutorial/controller/theme_controller.dart';
import 'package:getx_tutorial/ui/pages/add_task_page.dart';

import '../../../../const/colors.dart';
import '../../../../const/dimens.dart';
import '../../../../utils/helper/format_helper.dart';
import '../../../../widgets/easy_text_widget.dart';

// final ThemeController themeController = Get.put(ThemeController());

class HomePageHeaderItemsView extends StatelessWidget {
  const HomePageHeaderItemsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultSpace,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          DateTimeView(),
          AddTaskBtnView(),
        ],
      ),
    );
  }
}

class DateTimeView extends StatelessWidget {
  const DateTimeView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(
          () => EasyTextWidget(
            text:
                FormatHelper.yMMMMDFormat(Get.find<ThemeController>().dateTime),
            fontSize: 22,
            color: Get.find<ThemeController>().isDarkMode.value
                ? Colors.grey
                : Colors.grey[600],
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        EasyTextWidget(
          text: kTodayText,
          fontSize: 26,
          fontWeight: FontWeight.bold,
        ),
      ],
    );
  }
}

class AddTaskBtnView extends StatelessWidget {
  const AddTaskBtnView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 70,
      child: ElevatedButton.icon(
        onPressed: () {
          Get.to(
            () => AddTasksPage(),
            transition: Transition.fadeIn,
            curve: Curves.fastOutSlowIn,
            duration: const Duration(milliseconds: 1000),
          );
        },
        icon: Icon(Icons.add),
        label: EasyTextWidget(
          text: kAddNewTaskText,
          fontSize: 16,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class DatePickerItemsView extends StatelessWidget {
  DatePickerItemsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        horizontal: kDefaultPadding,
        vertical: kDefaultSpace - 10,
      ),
      child: DatePicker(
        DateTime.now(),
        height: 100,
        width: 80,
        initialSelectedDate: DateTime.now(),
        selectionColor: kBluishColor,
        selectedTextColor: kWhiteColor,
        dateTextStyle: TextStyle(
          fontSize: 22,
          fontWeight: FontWeight.w600,
          color: Colors.grey,
        ),
        monthTextStyle: TextStyle(
          fontSize: 10,
          fontWeight: FontWeight.normal,
          color: Colors.grey[600],
        ),
        dayTextStyle: TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.normal,
          color: Colors.grey[700],
        ),
      ),
    );
  }
}
