import 'package:attendance_app/utils/api_endpoints.dart';
import 'package:attendance_app/utils/constant.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:get/get_connect/connect.dart';
import 'package:get/route_manager.dart';
import 'package:logger/logger.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthService {
  final GetConnect _connect = GetConnect(timeout: const Duration(seconds: 30));
  Logger logger = Logger();
  Future signInUser({
    String? email,
    String? staffId,
    BuildContext? context,
  }) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();

    loadingBar(context!);
    final res = await _connect.post(
        "${APIEndpoints.base_url}/${APIEndpoints.login}",
        {"email": email, "staffId": staffId});
    if (res.statusCode == 200) {
      logger.d(res.body);
      //Get and store user token
      // String token = res.body['message']['auth_token'];
      String id = res.body['employee']['id'];
      // sharedPreferences.setString("token", token);
      sharedPreferences.setString("userId", id);
      if (context.mounted) {
        Navigator.pop(context);
        Get.toNamed(AppRouter.dashboard);
        // getInUser();
        // userController.setuserProfile(454554);
        // userController.setuser(User.fromJson(res.body['message']));
      }

      logger.d(res.body);
      // return UserModel.fromJson(res.body);

      // userProfile();
    } else {
      String message = res.body['message'];
      logger.d(res.body);
      if (context.mounted) {
        Navigator.pop(context);
        showSnackBar(message: message, isError: true);
      }
    }
    return null!;
  }
}
