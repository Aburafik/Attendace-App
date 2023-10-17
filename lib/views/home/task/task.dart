import 'package:attendance_app/components/common_textfield.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/views/dashboard/splash.dart';
import 'package:flutter/material.dart';

class TaskView extends StatelessWidget {
  const TaskView({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
          backgroundColor: CustomeColors.white,
          body: Column(
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
              const Expanded(
                  child: TabBarView(
                children: [
                  NewTaskViewComponent(),
                  Text("Task History"),
                ],
              ))
            ],
          )),
    );
  }
}

class NewTaskViewComponent extends StatelessWidget {
  const NewTaskViewComponent({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(
          height: 15,
        ),
        const Text("Create New Task"),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 15),
          child: CommonFieldComponent(
            hintText: "Task Title",
          ),
        ),
        const Expanded(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CommonFieldComponent(
                  hintText: "Task Description",
                  keyboardType: TextInputType.multiline,
                  minLines: 1,
                  maxLines: 20,
                  maxLength: 1000,
                ),
              ],
            ),
          ),
        ),
        // Spacer(),
        CommonButton(
          title: "Submit",
          onTap: () {},
        )
      ],
    );
  }
}
