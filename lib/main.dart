import 'package:attendance_app/utils/router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: AppRouter.initial,
      getPages: AppRouter.routes,
      builder: EasyLoading.init(),
    );
  }
}




// import 'package:flutter/material.dart';
// import 'package:loading_indicator/src/shape/indicator_painter.dart';

/// BallScale.
