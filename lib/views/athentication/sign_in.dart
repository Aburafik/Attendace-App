import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:attendance_app/views/dashboard/splash.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SignInView extends StatelessWidget {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: CustomeColors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Icon(
                    FeatherIcons.send,
                    color: CustomeColors.secondary,
                  ),
                  const Text(
                    "NEXTGEN",
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
              const Padding(
                padding: EdgeInsets.symmetric(vertical: 20),
                child: Text(
                  "Enter your account to\ncontinue",
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
              ),
              headingText(title: "Enter your co operate email"),
              const CommonFieldComponent(
                hintText: "jacon@nextgen.com",
              ),
              headingText(title: "Enter your staff ID"),
              const CommonFieldComponent(
                hintText: "HB-012",
                prefixIcon: Icon(FeatherIcons.eyeOff),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Checkbox.adaptive(
                        activeColor: CustomeColors.secondary,
                        value: true,
                        onChanged: (va) {},
                      ),
                      const Text("Remember me"),
                    ],
                  ),
                  Text(
                    "Forgot password?",
                    style: TextStyle(
                        color: CustomeColors.secondary,
                        fontWeight: FontWeight.w600,
                        fontSize: 12),
                  )
                ],
              ),
              const SizedBox(height: 30),
              CommonButton(
                title: "Sign In",
                onTap: () {
                  Get.toNamed(AppRouter.dashboard);
                },
              )
            ],
          ),
        ),
      ),
    );
  }

  Padding headingText({String? title}) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, bottom: 10),
      child: Text(title!),
    );
  }
}

class CommonFieldComponent extends StatelessWidget {
  const CommonFieldComponent({
    super.key,
    this.prefixIcon,
    this.controller,
    this.hintText,
  });
  final Widget? prefixIcon;
  final TextEditingController? controller;
  final String? hintText;
  @override
  Widget build(BuildContext context) {
    return Material(
      color: CustomeColors.white,
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
          side: const BorderSide(color: Color(0xffDAE1E1))),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5),
        child: TextField(
          controller: controller,
          decoration: InputDecoration(
              border: InputBorder.none,
              suffixIcon: prefixIcon,
              hintText: hintText,
              hintStyle: const TextStyle(color: Color(0xffDAE1E1))),
        ),
      ),
    );
  }
}
