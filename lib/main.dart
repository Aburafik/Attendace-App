import 'package:attendance_app/controllers/notifications_controller.dart';
import 'package:attendance_app/firebase_options.dart';
import 'package:attendance_app/utils/router.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp(
    // name: 'FEEDHUB',
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
          channelGroupKey: 'basic_channel_group',
          channelKey: 'basic_channel',
          channelName: 'Basic notifications',
          channelDescription: 'Notification channel for basic tests',
          defaultColor: Color(0xFF9D50DD),
          ledColor: Colors.white)
    ],
    // Channel groups are only visual and are not required
    channelGroups: [
      NotificationChannelGroup(
          channelGroupKey: 'basic_channel_group',
          channelGroupName: 'Basic group')
    ],
  );
  bool isAllowedToSendNotifications =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedToSendNotifications) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  IO.Socket? socket;
  TextEditingController messageController = TextEditingController();
  List<Map> messages = [];
  // Box<Task>? taskbox;
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().setListeners(
        onActionReceivedMethod: NotificationController.onActionReceivedMethod,
        onNotificationCreatedMethod:
            NotificationController.onNotificationCreatedMethod,
        onNotificationDisplayedMethod:
            NotificationController.onNotificationDisplayedMethod,
        onDismissActionReceivedMethod:
            NotificationController.onDismissActionReceivedMethod);
    connectToServer();
  }

  void connectToServer() {
    socket = IO.io('https://attendance-app-m0oa.onrender.com', <String, dynamic>{
      'transports': ['websocket'],
      'autoConnect': false,
    });
    socket?.connect();
    socket?.onConnecting(
        (data) => print("Connecting to the socket server::::::::::::::"));
    socket?.on('newNotification', (data) {
      print('Received message: $data');
      AwesomeNotifications().createNotification(
        content: NotificationContent(
            id: 1,
            channelKey: "basic_channel",
            title: data['title'].toString(),
            body: data['body'].toString()),
      );
      setState(() {
        messages.add(data);
      });
    });
    socket?.onConnect((_) {
      print('Connected to the socket server');
    });

    socket?.onDisconnect((_) {
      print('Disconnected from the socket server');
    });

    socket?.onConnectError((data) => print("Connect error: $data"));
  }

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

