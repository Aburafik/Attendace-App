// ignore_for_file: constant_identifier_names

class APIEndpoints {
  static const String base_url =
      "https://calm-puce-monkey-shoe.cyclic.app/api/employee";
  static const String login = "/login";
  static const String clock_in = "/attendance/clock-in";
  static const String clock_out = "/attendance/clock-out";
  static const String get_attendance_history = "/attendance/";
  static const String get_all_task = "/task/";
  static const String create_task = '/create-task';
  static const String update_task = '/task/edit/';
  static const String delete_task = '/delete-task';
}
