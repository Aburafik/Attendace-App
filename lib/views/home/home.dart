import 'package:attendance_app/utils/colors.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var smallTextStyle = TextStyle(fontSize: 11, color: CustomeColors.grey);
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        backgroundColor: CustomeColors.primary,
        toolbarHeight: 100,
        title: Row(
          children: [
            const CircleAvatar(
              radius: 25,
            ),
            const SizedBox(width: 5),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "user name",
                  style: TextStyle(color: CustomeColors.lightGrey),
                ),
                Text(
                  "UI/UX Desiner",
                  style: smallTextStyle,
                ),
              ],
            )
          ],
        ),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                FeatherIcons.bell,
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
                  child: Container(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    child: const Column(children: [
                      Text("Attendance Summary"),
                    ]),
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
                const Wrap(
                  spacing: 40,
                  runSpacing: 20,
                  children: [
                    OfficeServiceWidget(
                      title: "Task",
                      icon: Icons.task,
                    ),
                    OfficeServiceWidget(
                      title: "Report",
                      icon: FeatherIcons.file,
                    ),
                    OfficeServiceWidget(
                      title: "Calender",
                      icon: FeatherIcons.calendar,
                    ),
                    OfficeServiceWidget(
                      title: "Leave",
                      icon: FeatherIcons.fileText,
                    ),
                    OfficeServiceWidget(
                      title: "Clock In",
                      icon: Icons.fingerprint,
                    ),
                  ],
                )
              ],
            ),
          )
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
  });
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}
