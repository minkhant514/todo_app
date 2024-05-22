import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../const/colors.dart';
import '../../../const/dimens.dart';
import '../../../controller/add_task_controller.dart';
import '../../../controller/theme_controller.dart';
import '../../../data/vo/task.dart';
import '../../../widgets/easy_text_widget.dart';

class TaskListItemsView extends StatelessWidget {
  const TaskListItemsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Obx(
        () {
          return Container(
            margin: const EdgeInsets.only(top: k10SP),
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Get.find<ThemeController>().isDarkMode.value
                  ? kDarkGreyColor
                  : Color.fromARGB(40, 177, 177, 177),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(kDefaultRadius),
                topRight: Radius.circular(kDefaultRadius),
              ),
            ),
            child: Obx(
              () {
                final controller = Get.find<AddTaskController>();
                if (controller.tasks.isEmpty) {
                  return TaskListPlaceholderView();
                }
                return _taskListView(controller);
              },
            ),
          );
        },
      ),
    );
  }

  ListView _taskListView(AddTaskController controller) {
    return ListView.builder(
      itemCount: controller.tasks.length,
      padding: EdgeInsets.symmetric(
          vertical: kDefaultSpace, horizontal: kDefaultPadding),
      itemBuilder: (_, index) {
        Task task = controller.tasks[index];
        return Card(
          child: ListTile(
            leading: Text(task.title?.toString() ?? ''),
          ),
        );
      },
    );
  }
}

class TaskListPlaceholderView extends StatelessWidget {
  const TaskListPlaceholderView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      mainAxisSize: MainAxisSize.min,
      children: [
        EasyTextWidget(
          text: "No Task Here!!!!",
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
        const SizedBox(
          height: kDefaultSpace - 16,
        ),
        EasyTextWidget(
          text: "Create New Task",
          fontSize: 18,
          fontWeight: FontWeight.w400,
        ),
      ],
    );
  }
}
