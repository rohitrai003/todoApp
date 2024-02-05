import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/src/provider/taskOperation.dart';

Future<void> saveList(List<String> list) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setStringList('task', list);
}

Future loadList() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  TaskOperation().task = prefs.getStringList('task') ?? [];
}
