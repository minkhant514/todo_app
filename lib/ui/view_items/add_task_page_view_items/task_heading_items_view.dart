import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/add_task_controller.dart';
import 'package:getx_tutorial/data/vo/task.dart';

// import 'package:getx_tutorial/controller/theme_controller.dart';

import '../../../const/dimens.dart';
import '../../../const/string.dart';
import '../../../widgets/easy_text_widget.dart';

/// add new task btn session
class AddTaskBtn extends StatelessWidget {
  const AddTaskBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: k6SP),
      child: ElevatedButton(
        onPressed: () {
          bool isSuccess = Get.find<AddTaskController>().validation();
          print(isSuccess);
          if (isSuccess) {
            _addTaskToDataBase(context);

            Get.find<AddTaskController>().titleController.clear();
            Get.find<AddTaskController>().noteController.clear();
          }
        },
        child: Icon(Icons.check),
      ),
    );
  }

  _addTaskToDataBase(BuildContext context) {
    final addTaskController = Get.find<AddTaskController>();
    var titleText = addTaskController.titleText;
    var noteText = addTaskController.noteText;
    var date = addTaskController.date;
    var time = addTaskController.time(context);
    var repeat = addTaskController.repeat;
    addTaskController.addTaskToDataBase(
      Task(
        id: 1,
        title: titleText,
        note: noteText,
        date: date,
        time: time,
        repeat: repeat,
        isComplete: 1,
      ),
    );
  }
}

/// dividers and add task session
class TaskHeadingItemsView extends StatelessWidget {
  const TaskHeadingItemsView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding - 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: Divider(
              endIndent: 10,
            ),
          ),
          EasyTextWidget(
            text: kAddTaskText,
            fontSize: 30,
            fontWeight: FontWeight.bold,
          ),
          Expanded(
            child: Divider(
              indent: 10,
            ),
          )
        ],
      ),
    );
  }
}
