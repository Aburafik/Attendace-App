// ignore_for_file: null_check_always_fails

import 'package:attendance_app/models/attendance_model.dart';
import 'package:attendance_app/utils/api_endpoints.dart';
import 'package:attendance_app/utils/constant.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_indicator/loading_indicator.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AttendanceService {
  final GetConnect _connect = GetConnect(timeout: const Duration(seconds: 30));
  Logger logger = Logger();

  //Clock in user
  Future markAttendance({BuildContext? context, String? type}) async {
    //Get the stored employee id for clock in.
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String employeedId = sharedPreferences.getString("userId")!;
    loadingBar(
      context!,
      widget: SizedBox(
        height: 200,
        child: LoadingIndicator(
            indicatorType: Indicator.ballScale,
            colors: [Colors.black],
            strokeWidth: 2,
            backgroundColor: Colors.white.withOpacity(0.0),
            pathBackgroundColor: Colors.black),
      ),
    );
    Map body = {
      "latitude": 12.9716,
      "longitude": 77.5946,
      "employeeId": employeedId
    };
    final res = type == "clock-in"
        ? await _connect.post(
            "${APIEndpoints.base_url}/${APIEndpoints.clock_in}", body)
        : await _connect.patch(
            "${APIEndpoints.base_url}/${APIEndpoints.clock_out}", body);
    if (res.statusCode == 200) {
      logger.d(res.body);
      //Get and store employee Id
      if (context.mounted) {
        String message = res.body['message'];
        Navigator.pop(context);
        Get.toNamed(AppRouter.dashboard);
        showSnackBar(
          message: message,
        );
      }
    } else {
      String message = res.body['message'];
      logger.d(res.body);
      if (context.mounted) {
        Get.toNamed(AppRouter.dashboard);

        Navigator.pop(context);

        showSnackBar(message: message, isError: true);
      }
    }
    return null!;
  }

  ///GET employee attendance history
  Future <List<AttendanceModel>> getAttendaceHistory() async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String employeedId = sharedPreferences.getString("userId")!;

    final res = await _connect.get(
      "${APIEndpoints.base_url}/${APIEndpoints.get_attendance_history}$employeedId",
    );

    if (res.statusCode == 200) {
      logger.d(res.body);

      return attendanceModelFromJson(res.body);
    } else {
      String message = res.body['message'];
      logger.d(res.body);
    }
    return null!;
  }
}
