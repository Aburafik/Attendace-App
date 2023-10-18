import 'package:attendance_app/controllers/task_controller.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/views/home/task/task.dart';
import 'package:attendance_app/views/home/task/update_task.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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
                      trailing: GestureDetector(
                        onTap: () {
                          showModalBottomSheet(
                              backgroundColor:
                                  Theme.of(context).scaffoldBackgroundColor,
                              constraints: BoxConstraints.loose(
                                Size(MediaQuery.of(context).size.width,
                                    MediaQuery.of(context).size.height * 0.80),
                              ),
                              isScrollControlled: true,
                              context: context,
                              builder: (context) => UpdateTaskComponent(
                                    employeeTaskModel: taskController!
                                        .employeeTaskHistory[index],
                                  ));
                        },
                        child: const Icon(
                          FeatherIcons.edit,
                          size: 20,
                        ),
                      ),
                      title: Text(
                          taskController!.employeeTaskHistory[index].title),
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
