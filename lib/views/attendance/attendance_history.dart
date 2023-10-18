import 'package:attendance_app/controllers/attendance_controller.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/constant.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AttendanceHistory extends StatelessWidget {
  AttendanceHistory({super.key});
  final AttendanceController attendanceController =
      Get.find<AttendanceController>();

  formatDate({int? index}) {
    final DateTime clockIn =
        attendanceController.employeeAttendanceHistory[index!].clockInTime;
    final DateFormat formatter = DateFormat("MMM d");
    final String formatted = formatter.format(clockIn);
    return formatted;
  }

  formatTime({int? index}) {
    // final DateTime clockIn =
    //     attendanceController.employeeAttendanceHistory[index!].clockInTime;
    // final DateFormat formatter = DateFormat("MMMM d yyyy");
    // final String formatted = formatter.format(clockIn);
    final DateTime time =
        attendanceController.employeeAttendanceHistory[index!].clockInTime;
    final DateFormat formatteredTime = DateFormat().add_jm();
    final String formattedTime = formatteredTime.format(time);
    return formattedTime;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Obx(() {
          return attendanceController.employeeAttendanceHistory.isEmpty
              ? const Text("asnd")
              : Column(
                  children: [
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          titleWrapper(
                              title: "Date", color: CustomeColors.secondary),
                          titleWrapper(
                            title: "Time In",
                            color: const Color(0xffDEF0E4),
                          ),
                          titleWrapper(
                            title: "Time Out",
                            color: const Color(0xffFFF0DA),
                          ),
                          // Material(
                          //   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                          //     color: const Color(0xffFFF0DA),
                          //     child: const Padding(
                          //       padding: EdgeInsets.all(6.0),
                          //       child: Text("Time Out"),
                          //     )),
                        ]),
                    Expanded(
                      child: ListView.builder(
                          itemCount: attendanceController
                              .employeeAttendanceHistory.length,
                          itemBuilder: (context, index) {
                            final date = formatDate(index: index);
                            final time = formatTime(index: index);
                            return Padding(
                              padding: EdgeInsets.only(top: 10),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  CircleAvatar(),
                                  Text(date),
                                  Text(time),
                                ],
                              ),
                            );
                          }),
                    ),
                  ],
                );
        }),
      ),
    );
  }

  Material titleWrapper({
    String? title,
    Color? color,
  }) {
    return Material(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        color: color,
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 6.0, horizontal: 15),
          child: Text(title!),
        ));
  }
}
