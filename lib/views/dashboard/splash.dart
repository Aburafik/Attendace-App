import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/images.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SplashView extends StatelessWidget {
  const SplashView({super.key});

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
                        onTap: () => Get.toNamed(AppRouter.signIn),
                      ),
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
