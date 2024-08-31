import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/Screens/HomePage.dart';
import 'package:todo_list_app/src/provider/taskOperation.dart';
import 'package:awesome_notifications/awesome_notifications.dart';

void main() async {
  AwesomeNotifications().initialize(null, [
    NotificationChannel(
        channelKey: "basic_channel",
        channelName: "Basic Notification",
        channelDescription: "Notification Channel for basic notifcation")
  ]);
  runApp(ChangeNotifierProvider(
    create: (context) => TaskOperation(),
    builder: (context, child) => const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}
