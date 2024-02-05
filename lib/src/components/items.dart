import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/Constant/Color.dart';
import 'package:todo_list_app/src/provider/taskOperation.dart';

class ItemBox extends StatefulWidget {
  ItemBox({super.key, required this.index});
  int index;
  // List task;

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  @override
  Widget build(BuildContext context) {
    var taskOperation = Provider.of<TaskOperation>(context);
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      height: 60,
      margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
      decoration: BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.circular(10),
        boxShadow: const [
          BoxShadow(offset: Offset(0, 2), color: Colors.grey, blurRadius: 5),
        ],
      ),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Checkbox(
                checkColor: kSecondaryColor,
                activeColor: kPrimaryColor,
                value: taskOperation.taskCompleted[widget.index],
                onChanged: (value) {
                  taskOperation.taskComplete(widget.index);
                  print(taskOperation.taskCompleted.elementAt(widget.index));
                }),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: taskOperation.taskCompleted[widget.index] == false
                  ? Text(taskOperation.task[widget.index])
                  : Text(
                      taskOperation.task[widget.index],
                      style: const TextStyle(
                          decoration: TextDecoration.lineThrough),
                    ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            taskOperation.deleteTask(widget.index);
          },
          child: Container(
            height: 35,
            width: 35,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5), color: kPrimaryColor),
            child: Center(
              child: Icon(
                Icons.delete,
                color: kSecondaryColor,
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
// items(int index, context, List task) {
//   return 
// }
