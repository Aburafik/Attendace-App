import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/views/dashboard/splash.dart';
import 'package:attendance_app/views/home/calender/calender.dart';
import 'package:attendance_app/views/home/leave/leave.dart';
import 'package:attendance_app/views/home/reports/report.dart';
import 'package:attendance_app/views/home/task/task.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

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
                    // OfficeServiceWidget(
                    //   title: "Clock In",
                    //   icon: Icons.fingerprint,
                    // ),
                  ],
                )
              ],
            ),
          ),
          Spacer(),
          GestureDetector(
            onTap: () {
              // print("CLOCK IN");
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
                Text(
                  "Clock In",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w500),
                )
              ],
            )),
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
  });
  final String? title;
  final IconData? icon;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => Get.toNamed(HomeNavigation.settings,
          id: HomeNavigation.id, arguments: title),
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

class HomeNavigation {
  HomeNavigation._();

  static const id = 1;

  static const main = '/main';
  static const settings = '/categories';
}

class HomeViewWrapper extends StatelessWidget {
  const HomeViewWrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Navigator(
      key: Get.nestedKey(HomeNavigation.id),
      onGenerateRoute: (routeSetting) {
        if (routeSetting.name == HomeNavigation.settings) {
          return GetPageRoute(
            routeName: HomeNavigation.settings,
            page: () => AccountSettings(
              id: HomeNavigation.id,
              first: false,
              arguments: routeSetting.arguments,
            ),
          );
        } else {
          return GetPageRoute(
            routeName: HomeNavigation.main,
            page: () => AccountSettings(
              id: HomeNavigation.id,
              first: true,
              arguments: routeSetting.arguments,
            ),
          );
        }
      },
    );
  }
}

class AccountSettings extends StatelessWidget {
  final int? id;
  final bool first;
  final Object? arguments;

  const AccountSettings(
      {Key? key, this.id, required this.first, this.arguments})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (first) {
      return HomeView();
    } else {
      return HomeCategories(
        settingType: arguments,
      );
    }
  }
}

class HomeCategories extends StatelessWidget {
  const HomeCategories({super.key, this.settingType});
  final Object? settingType;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          // backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          backgroundColor: CustomeColors.primary,
          title: Text(
            settingType.toString(),
            // style: smallTextStyle.copyWith(
            //     fontSize: 18,
            //     color: CustomColors.blackColor,
            //     fontWeight: FontWeight.w500)
          ),
        ),
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15),
          child: getDisplayView(settingType),
        ));
  }
}

getDisplayView(settingType) {
  switch (settingType) {
    case 'Task':
      return TaskView();
    case 'Report':
      return Report();
    case 'Calender':
      return const CalenderVC();
    case 'Leave':
      return const LeaveVC();

    default:
  }
}
