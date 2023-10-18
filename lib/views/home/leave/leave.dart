import 'package:attendance_app/utils/constant.dart';
import 'package:flutter/material.dart';

class LeaveVC extends StatelessWidget {
  const LeaveVC({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(),
      body: Center(child: Text("LEAVE"),),
    );
  }
}