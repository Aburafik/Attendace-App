import 'package:attendance_app/views/athentication/sign_in.dart';
import 'package:attendance_app/views/dashboard/dashboard.dart';
import 'package:attendance_app/views/dashboard/splash.dart';
import 'package:get/route_manager.dart';

class AppRouter {
  static const String initial = "/";
  static const String signIn = "/signIn";
  static const String dashboard = "/dashboard";

  static List<GetPage> routes = [
    GetPage(name: initial, page: () => SplashView()),
    GetPage(name: signIn, page: () => SignInView()),
    GetPage(name: dashboard, page: () => DashBoardView())
  ];
}
