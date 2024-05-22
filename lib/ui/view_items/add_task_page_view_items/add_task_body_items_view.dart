import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/const/colors.dart';
import 'package:getx_tutorial/controller/add_task_controller.dart';
import 'package:getx_tutorial/controller/theme_controller.dart';
import 'package:getx_tutorial/ui/view_items/add_task_page_view_items/task_heading_items_view.dart';
import 'package:getx_tutorial/widgets/easy_text_widget.dart';

import '../../../const/dimens.dart';
import '../../../utils/helper/format_helper.dart';
import '../../../widgets/label_and_input_field_widget.dart';

class AddTaskBodyItemsView extends StatelessWidget {
  AddTaskBodyItemsView({
    super.key,
  });

  final AddTaskController addTaskController = Get.find<AddTaskController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        /// add task and divider session
        TaskHeadingItemsView(),
        const SizedBox(
          height: kDefaultSpace - 6,
        ),

        /// task title session
        _titleSession(),

        /// task noted session
        _notedSession(),

        /// date pick session
        _pickDateSession(context),

        /// time pick session
        _pickTimeSession(context),

        /// repeat or not session
        _repeatSession()
      ],
    );
  }

  Obx _repeatSession() {
    return Obx(
      () {
        return LabelAndInputFieldWidget(
          titleText: "Repeat",
          hint: addTaskController.selectedItem.value,
          widget: DropdownButton(
            icon: Icon(Icons.arrow_drop_down_circle_outlined),
            iconSize: kDefaultIconSize,
            underline: SizedBox(),
            dropdownColor: Get.find<ThemeController>().isDarkMode.value
                ? kDarkGreyColor
                : Colors.white,
            onChanged: (String? newItem) {
              print(newItem);
              addTaskController.selectedDropDrownItem(newItem);
            },
            items: addTaskController.repeatList
                .map<DropdownMenuItem<String>>(
                  (item) => DropdownMenuItem<String>(
                    value: item,
                    child: EasyTextWidget(
                      text: item,
                    ),
                  ),
                )
                .toList(),
          ),
        );
      },
    );
  }

  Padding _pickTimeSession(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Obx(
        () {
          return LabelAndInputFieldWidget(
            titleText: "Time",
            hint: FormatHelper.timeFormat(
              context,
              addTaskController.selectedTime.value,
            ),
            widget: TextButton.icon(
              onPressed: () {
                addTaskController.timePick(context);
              },
              icon: Icon(
                Icons.timer_outlined,
              ),
              label: Text("Choose time"),
            ),
          );
        },
      ),
    );
  }

  Padding _pickDateSession(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: Obx(
        () => LabelAndInputFieldWidget(
          titleText: "Date",
          hint: FormatHelper.yMDFormat(addTaskController.selectedDate.value),
          widget: TextButton.icon(
            onPressed: () {
              addTaskController.datePick(context);
            },
            icon: Icon(
              Icons.date_range_outlined,
            ),
            label: Text("Choose date"),
          ),
        ),
      ),
    );
  }

  Padding _notedSession() {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: LabelAndInputFieldWidget(
        titleText: "Noted",
        hint: "What's your planning",
        textEditingController: addTaskController.noteController,
        noted: true,
      ),
    );
  }

  Padding _titleSession() {
    return Padding(
      padding: const EdgeInsets.only(bottom: kDefaultPadding),
      child: LabelAndInputFieldWidget(
        titleText: "Title",
        hint: "Task Title",
        textEditingController: addTaskController.titleController,
      ),
    );
  }
}
