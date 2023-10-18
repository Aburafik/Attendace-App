import 'package:attendance_app/components/common_textfield.dart';
import 'package:attendance_app/controllers/task_controller.dart';
import 'package:attendance_app/services/task_service.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/constant.dart';
import 'package:attendance_app/views/dashboard/splash.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class TaskView extends StatelessWidget {
  TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          appBar: commonAppBar(),
          backgroundColor: CustomeColors.white,
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                TabBar(
                    enableFeedback: false,
                    labelPadding: EdgeInsets.zero,
                    indicatorPadding: EdgeInsets.zero,
                    indicatorColor: CustomeColors.primary,
                    padding: EdgeInsets.zero,
                    unselectedLabelColor: CustomeColors.grey,
                    labelColor: CustomeColors.primary,
                    labelStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w700,
                    ),
                    tabs: const [
                      Tab(
                        child: Text("New Task"),
                      ),
                      Tab(
                        child: Text("Task History"),
                      )
                    ]),
                Expanded(
                    child: TabBarView(
                  children: [
                    NewTaskViewComponent(),

                    GetBuilder<TaskController>(
                        builder: (controller) => TaskHistory(
                              taskController: controller,
                            ))
                    ///////////
                  ],
                ))
              ],
            ),
          )),
    );
  }
}

class NewTaskViewComponent extends StatelessWidget {
  NewTaskViewComponent({super.key});
  final TaskService taskService = TaskService();
  final TextEditingController titleController = TextEditingController();
  final TextEditingController descriptionController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text("Create New Task"),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15),
          child: CommonFieldComponent(
            hintText: "Task Title",
            controller: titleController,
          ),
        ),
        Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonFieldComponent(
                  hintText: "Task Description",
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 20,
                  maxLength: 1000,
                  controller: descriptionController,
                ),
              ],
            ),
          ),
        ),
        // Spacer(),
        SafeArea(
          child: CommonButton(
            title: "Submit",
            onTap: () {
              taskService.createNewTask(
                context: context,
                title: titleController.text,
                description: descriptionController.text,
              );
            },
          ),
        )
      ],
    );
  }
}

class TaskHistory extends StatelessWidget {
  TaskHistory({super.key, this.taskController});
  TaskController? taskController;
  formatDate({int? index}) {
    final DateTime timeCreate =
        taskController!.employeeTaskHistory[index!].timestamp;
    final DateFormat formatter = DateFormat("MMM d");
    final String formatted = formatter.format(timeCreate);

    ///////forma time
    ///final DateTime time =
    // attendanceController.employeeAttendanceHistory[index!].clockInTime;
    final DateFormat formatteredTime = DateFormat().add_jm();
    final String formattedTime = formatteredTime.format(timeCreate);
    return "$formatted $formattedTime";
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: ListView.builder(
          itemCount: taskController!.employeeTaskHistory.length,
          itemBuilder: (context, index) {
            String time = formatDate(index: index);
            return taskController!.employeeTaskHistory.isEmpty
                ? const Center(
                    child: Text("No Task History"),
                  )
                : Card(
                    elevation: .4,
                    margin: const EdgeInsets.symmetric(vertical: 10),
                    surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
                    color: Theme.of(context).scaffoldBackgroundColor,
                    shape: const RoundedRectangleBorder(),
                    child: ListTile(
                      leading: Icon(
                        Icons.check_circle,
                        color: CustomeColors.primary,
                      ),
                      trailing: const Icon(
                        FeatherIcons.edit,
                        size: 20,
                      ),
                      title: const Text("asjhfb"),
                      subtitle: Text(
                        time,
                        style:
                            TextStyle(fontSize: 12, color: CustomeColors.grey),
                      ),
                    ),
                  );
          }),
    );
  }
}
