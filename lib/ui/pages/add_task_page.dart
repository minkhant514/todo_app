import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/controller/add_task_controller.dart';

import '../../const/dimens.dart';
import '../view_items/add_task_page_view_items/add_task_body_items_view.dart';
import '../view_items/add_task_page_view_items/task_heading_items_view.dart';

class AddTasksPage extends StatelessWidget {
  AddTasksPage({super.key});
  final AddTaskController addTaskController = Get.put(AddTaskController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _appBar(),
      body: _bodyContent(),
    );
  }

  /// add new task app bar session
  AppBar _appBar() {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: IconButton(
        icon: Icon(
          Icons.arrow_back_ios_new_outlined,
          size: 24,
        ),
        onPressed: () {
          Get.back();
        },
      ),
      actions: [
        AddTaskBtn(),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  /// add new task body session
  Widget _bodyContent() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: kDefaultSpace,
          horizontal: kDefaultPadding,
        ),
        child: AddTaskBodyItemsView(),
      ),
    );
  }
}
