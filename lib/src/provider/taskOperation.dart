import 'package:flutter/material.dart';
import 'package:todo_list_app/src/data/taskList.dart';

class TaskOperation extends ChangeNotifier {
  addTask(String s, context, Future saveData) {
    if (s.isNotEmpty) {
      task.add({"task": s, "isCompleted": false});
      notifyListeners();
      print("From Provider : $task");
    } else {
      const snackBar = SnackBar(content: Text('No Task Added'));
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
      notifyListeners();
    }
  }

  deleteTask(int index, Future saveData()) {
    task.removeAt(index);
    saveData();
    print(task);
    notifyListeners();
  }

  taskComplete(int index) {
    task[index]["isCompleted"] = !task[index]["isCompleted"];
    print(task[index]["isCompleted"]);
    notifyListeners();
  }
}
