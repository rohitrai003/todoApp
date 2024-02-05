import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/Screens/HomePage.dart';
import 'package:todo_list_app/src/provider/taskOperation.dart';

void main() {
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
