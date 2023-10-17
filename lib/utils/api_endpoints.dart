// ignore_for_file: constant_identifier_names

class APIEndpoints {
  static const String base_url = "https://calm-puce-monkey-shoe.cyclic.app/api";
  static const String login = "/employee/login";
  static const String clock_in = "employee/attendance/clock-in";
  static const String clock_out = "employee/attendance/clock-out";
  static const String get_attendance_history = "employee/attendance/:";
  static const String create_task = '/create-task';
  static const String edit_task = '/edit-task';
  static const String delete_task = '/delete-task';
}
