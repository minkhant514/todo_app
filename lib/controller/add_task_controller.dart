import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_tutorial/data/dataBase/data_base_helper.dart';
import 'package:getx_tutorial/ui/pages/home_page.dart';

import '../data/vo/task.dart';
import '../utils/helper/format_helper.dart';

class AddTaskController extends GetxController {
  TextEditingController _titleController = TextEditingController();
  TextEditingController _noteController = TextEditingController();
  var selectedDate = DateTime.now().obs;
  var selectedTime = TimeOfDay.now().obs;
  var selectedItem = ''.obs;
  var _repeatList = <String>[
    "None",
    "Once",
    "Daily",
    "Monthly",
  ].obs;

  var tasks = <Task>[].obs;

  DataBaseHelper _db = DataBaseHelper();

  TextEditingController get titleController => _titleController;

  TextEditingController get noteController => _noteController;

  String get date => FormatHelper.yMDFormat(selectedDate.value);

  String time(BuildContext context) {
    return FormatHelper.timeFormat(context, selectedTime.value);
  }

  String get repeat => selectedItem.value;

  String get titleText => _titleController.text;

  String get noteText => _noteController.text;

  List<String> get repeatList => _repeatList;

  /// choose date
  Future<void> datePick(BuildContext context) async {
    int year = DateTime.now().year;
    DateTime? dateTime = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(year - 10),
      lastDate: DateTime(year + 10),
    );
    if (dateTime != null) {
      selectedDate.value = dateTime;
      print("Date is ${selectedDate.value}");
    } else {
      print("Date is null");
    }
  }

  /// choose time
  Future<void> timePick(BuildContext context) async {
    TimeOfDay? time = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
      initialEntryMode: TimePickerEntryMode.dial,
    );
    if (time != null) {
      selectedTime.value = time;
      print("time is ${selectedDate.value}");
    } else {
      print("time is null");
    }
  }

  /// drop down user selected repeat
  selectedDropDrownItem(String? newValue) {
    selectedItem.value = newValue ?? 'Null';
  }

  /// validation for title and noted that not allowed to be null
  bool validation() {
    if (_titleController.text.isNotEmpty && _noteController.text.isNotEmpty) {
      Get.snackbar(
        "Success",
        " Successfully add your task. ",
        icon: Image.asset("images/todo_logo.png"),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        colorText: Colors.white,
        backgroundColor: Colors.green,
      );
      Get.back<HomePage>();

      return true;
    } else {
      Get.snackbar(
        "Warming!!!",
        "You need to fill Title and Noted ",
        icon: Image.asset("images/todo_logo.png"),
        snackPosition: SnackPosition.TOP,
        margin: const EdgeInsets.all(16),
        isDismissible: true,
        dismissDirection: DismissDirection.horizontal,
        // titleText: EasyTextWidget(
        //   text: "Warming",
        //   color: Colors.red,
        // ),
        colorText: Colors.black,
        backgroundColor: Colors.amber[100],
      );

      return false;
    }
  }

  void addTaskToDataBase(Task task) async {
    var value = await _db.insertTask(task);
    print(value);
    getAllTasks();
  }

  void getAllTasks() async {
    List<Map<String, dynamic>> taskList = await _db.getAllTasks();
    tasks.assignAll(
      taskList.map((task) => Task.fromJson(task)).toList(),
    );
  }

  void deleteAllTask() async {
    await _db.deleteAllTasks();
    tasks.value = [];
  }

  @override
  void onInit() {
    super.onInit();
    getAllTasks();
  }

  @override
  void onReady() {
    super.onReady();
    selectedItem.value = _repeatList[0];
  }

  @override
  void onClose() {
    _titleController.dispose();
    _noteController.dispose();
    super.onClose();
  }
}
