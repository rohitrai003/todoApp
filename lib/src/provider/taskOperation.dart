import 'package:flutter/material.dart';

class TaskOperation extends ChangeNotifier {
  List<String> task = [];
  List<bool> taskCompleted = List.generate(50, (index) => false);
  addTask(String s, context) {
    if (s.isNotEmpty) {
      task.add(s);
      notifyListeners();
    } else {
      const snackBar = SnackBar(content: Text('No Task Added'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  deleteTask(int index) {
    task.removeAt(index);
    notifyListeners();
  }

  taskComplete(int index) {
    taskCompleted[index] = !taskCompleted[index];
    notifyListeners();
  }
}
