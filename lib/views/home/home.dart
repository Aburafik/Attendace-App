import 'package:attendance_app/controllers/employee_controller.dart';
import 'package:attendance_app/services/attendance_service.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
// import 'package:loading_indicator/loading_indicator.dart';

class HomeView extends StatelessWidget {
  HomeView({super.key});
  final EmployeeController userController = Get.find<EmployeeController>();
  final AttendanceService _attendanceService = AttendanceService();
  @override
  Widget build(BuildContext context) {
    var smallTextStyle = TextStyle(fontSize: 11, color: CustomeColors.grey);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomeColors.primary,
        toolbarHeight: 100,
        title: Obx(() {
          return Row(
            children: [
              const CircleAvatar(
                radius: 25,
              ),
              const SizedBox(width: 5),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    userController.user.value.name!,
                    style: TextStyle(color: CustomeColors.lightGrey),
                  ),
                  Text(
                    userController.user.value.role!,
                    style: smallTextStyle,
                  ),
                ],
              )
            ],
          );
        }),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.fingerprint,
                color: CustomeColors.white,
              ))
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                height: 100,
                padding: const EdgeInsets.symmetric(horizontal: 15),
                width: MediaQuery.sizeOf(context).width,
                color: CustomeColors.primary,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "How are you doing",
                      style: smallTextStyle.copyWith(
                          color: CustomeColors.white, fontSize: 14),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(10, 20, 10, 10),
                child: Card(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6)),
                  elevation: 1,
                  surfaceTintColor: CustomeColors.white,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Text(
                              "Work Summary",
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  children: [Text("Reports"), Text("23")],
                                ),
                                Column(
                                  children: [Text("Attendance"), Text("23")],
                                ),
                                Column(
                                  children: [Text("Leave"), Text("23")],
                                )
                              ],
                            )
                          ]),
                    ),
                  ),
                ),
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Office Services",
                  style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                      color: CustomeColors.black),
                ),
                const SizedBox(height: 20),
                Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  children: [
                    OfficeServiceWidget(
                      title: "Task",
                      icon: Icons.task,
                      onTap: () => Get.toNamed(AppRouter.Task),
                    ),
                    OfficeServiceWidget(
                      title: "Report",
                      icon: FeatherIcons.file,
                      onTap: () => Get.toNamed(AppRouter.Report),
                    ),
                    OfficeServiceWidget(
                      title: "Calender",
                      icon: FeatherIcons.calendar,
                      onTap: () => Get.toNamed(AppRouter.Calender),
                    ),
                    OfficeServiceWidget(
                      title: "Leave",
                      icon: FeatherIcons.fileText,
                      onTap: () => Get.toNamed(AppRouter.Leave),
                    ),
                    // OfficeServiceWidget(
                    //   title: "Clock In",
                    //   icon: Icons.fingerprint,
                    // ),
                  ],
                )
              ],
            ),
          ),

          const Spacer(),
          GestureDetector(
            onTap: () async {
              _attendanceService.markAttendance(
                  context: context, type: "clock-in");
              // Navigator.pop(context);
            },
            child: Align(
              child: Column(
                children: [
                  CircleAvatar(
                    radius: 40,
                    backgroundColor: CustomeColors.primary,
                    child: Icon(
                      Icons.fingerprint_rounded,
                      color: CustomeColors.white,
                    ),
                  ),
                  const Text(
                    "Clock In",
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
            ),
          )
          // CommonButton(title: "CLock In",)
        ],
      ),
    );
  }
}

class OfficeServiceWidget extends StatelessWidget {
  const OfficeServiceWidget({
    super.key,
    this.title,
    this.icon,
    this.onTap,
  });
  final String? title;
  final IconData? icon;
  final void Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          CircleAvatar(
            radius: 30,
            backgroundColor: const Color(0xffFEF1F6),
            child: Icon(
              icon,
              color: CustomeColors.primary,
              size: 40,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            title!,
            textAlign: TextAlign.center,
          )
        ],
      ),
    );
  }
}
