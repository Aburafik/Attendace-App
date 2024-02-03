import 'package:attendance_app/controllers/attendance_controller.dart';
import 'package:attendance_app/controllers/employee_controller.dart';
import 'package:attendance_app/controllers/leave_controller.dart';
import 'package:attendance_app/controllers/reports_controller.dart';
import 'package:attendance_app/controllers/task_controller.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/images.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/route_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  final EmployeeController employeeController = Get.put(EmployeeController());
  final AttendanceController attendanceController =
      Get.put(AttendanceController());
  final TaskController taskController = Get.put(TaskController());
  final LeaveController leaveController = Get.put(LeaveController());
  final ReportController reportController = Get.put(ReportController());
  IO.Socket? socket;
  @override
  void initState() {
    employeeController.onInit();
    attendanceController.onInit();
    taskController.onInit();
    leaveController.onInit();
    reportController.onInit();
    getUserDataIfloggegIn();

    // initSocket();
    super.initState();
  }

  getUserDataIfloggegIn() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String employeedId = sharedPreferences.getString("userId")!;
    if (employeedId.isNotEmpty) {
      attendanceController.getUser();
      taskController.getAllTask();
      leaveController.getAllLeaveHistiry();
      reportController.getReports();
    }
  }

  // initSocket() {
  //   socket = IO
  //       .io("http://localhost:3000/api/admin/notifications", <String, dynamic>{
  //     'autoConnect': true,
  //     'transports': ['websocket'],
  //   });
  //   socket!.connect();
  //   socket!.onConnect((_) {
  //     print('Connection established');
  //   });
  //   socket!.onDisconnect((_) => print('Connection Disconnection'));
  //   socket!.onConnectError((err) => print(err));
  //   socket!.onError((err) => print(err));
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(CustomImagaes.cover), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Get Your Attendance Recorded",
                    style: TextStyle(
                      color: Colors.white,
                      fontFamily: "Lato",
                      fontWeight: FontWeight.w600,
                      fontSize: 30,
                    ),
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    "Keep track of your Attendance by clocking In and Out",
                    style: TextStyle(color: CustomeColors.white),
                  )
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                decoration: BoxDecoration(
                  gradient: LinearGradient(colors: [
                    CustomeColors.black.withOpacity(.1),
                    CustomeColors.black.withOpacity(.8),
                    CustomeColors.black,
                    CustomeColors.black,
                    CustomeColors.black,
                  ], begin: Alignment.topCenter, end: Alignment.bottomCenter),
                ),
                height: 300,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    SafeArea(
                      child: CommonButton(
                          title: "Continue",
                          onTap: () async {
                            SharedPreferences sharedPreferences =
                                await SharedPreferences.getInstance();
                            String userId =
                                sharedPreferences.getString("userId")!;
                            userId.isNotEmpty
                                ? Get.toNamed(AppRouter.dashboard)
                                : Get.toNamed(AppRouter.signIn);
                          }),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CommonButton extends StatelessWidget {
  const CommonButton({
    super.key,
    this.title,
    this.onTap,
  });
  final String? title;
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 13),
        decoration: BoxDecoration(
            // color: Colors.red,
            gradient: LinearGradient(colors: [
              CustomeColors.primary,
              CustomeColors.primary,
              CustomeColors.secondary,
            ]),
            borderRadius: BorderRadius.circular(6)),
        child: Center(
          child: Text(
            title!,
            style: TextStyle(
                color: CustomeColors.white,
                fontSize: 16,
                fontWeight: FontWeight.w600),
          ),
        ),
      ),
    );
  }
}
