import 'package:attendance_app/components/common_textfield.dart';
import 'package:attendance_app/services/user_auth.dart';
import 'package:attendance_app/utils/colors.dart';
import 'package:attendance_app/utils/constant.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:attendance_app/views/dashboard/splash.dart';
import 'package:feather_icons/feather_icons.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';

class SignInView extends StatelessWidget {
  SignInView({super.key});
  final AuthService _authService = AuthService();
  TextEditingController emailController = TextEditingController();
  TextEditingController passWordController = TextEditingController();
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
              CommonFieldComponent(
                hintText: "jacon@nextgen.com",
                controller: emailController,
              ),
              headingText(title: "Enter your staff ID"),
              CommonFieldComponent(
                hintText: "HB-012",
                prefixIcon: Icon(FeatherIcons.eyeOff),
                controller: passWordController,
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
                onTap: () async {
                 await  _authService.signInUser(
                      email: emailController.text,
                      staffId: passWordController.text, 
                      context: context);
                  // Get.toNamed(AppRouter.dashboard);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
