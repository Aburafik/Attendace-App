import 'package:attendance_app/utils/constant.dart';
import 'package:flutter/material.dart';

class CalenderVC extends StatelessWidget {
  const CalenderVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Center(
        child: Text("Calender"),
      ),
    );
  }
}
