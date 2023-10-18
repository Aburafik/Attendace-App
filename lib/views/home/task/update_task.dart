import 'package:attendance_app/components/common_textfield.dart';
import 'package:attendance_app/models/employee_task_model.dart';
import 'package:attendance_app/services/task_service.dart';
import 'package:attendance_app/views/dashboard/splash.dart';
import 'package:flutter/material.dart';

class UpdateTaskComponent extends StatelessWidget {
  UpdateTaskComponent({super.key, this.employeeTaskModel});

  final EmployeeTaskModel? employeeTaskModel;
  final TaskService taskService = TaskService();

  @override
  Widget build(BuildContext context) {
    final TextEditingController titleController =
        TextEditingController(text: employeeTaskModel!.title);
    final TextEditingController descriptionController =
        TextEditingController(text: employeeTaskModel!.description);
    return Center(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            children: [
              const Text("Update Task"),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: CommonFieldComponent(
                  hintText: "Task Title",
                  controller: titleController,
                ),
              ),
              CommonFieldComponent(
                hintText: "Task Description",
                keyboardType: TextInputType.multiline,
                minLines: 1,
                maxLines: 20,
                maxLength: 1000,
                controller: descriptionController,
              ),
              const SizedBox(height: 100),
              // Spacer(),
              SafeArea(
                child: CommonButton(
                  title: "Submit",
                  onTap: () {
                    taskService
                        .updateTask(
                            context: context,
                            title: titleController.text,
                            description: descriptionController.text,
                            taskId: employeeTaskModel!.id)
                        .then((value) {
                      Navigator.pop(context);
                    });
                  },
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
