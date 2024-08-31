import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/Constant/Color.dart';
import 'package:todo_list_app/src/data/taskList.dart';
import 'package:todo_list_app/src/provider/taskOperation.dart';

// ignore: must_be_immutable
class ItemBox extends StatefulWidget {
  ItemBox(
      {super.key,
      required this.index,
      required this.saveData,
      required this.length});
  int index;
  int length;
  Future<dynamic> saveData;
  // List task;

  @override
  State<ItemBox> createState() => _ItemBoxState();
}

class _ItemBoxState extends State<ItemBox> {
  double height = 70;
  @override
  Widget build(BuildContext context) {
    var taskOperation = Provider.of<TaskOperation>(context);
    return AnimatedContainer(
      duration: const Duration(milliseconds: 100),
      curve: Curves.ease,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      margin: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
      decoration: BoxDecoration(
          shape: BoxShape.rectangle,
          color: Colors.white,
          borderRadius: BorderRadius.circular(15)),
      child: Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
        Row(
          children: [
            Checkbox(
                checkColor: kSecondaryColor,
                activeColor: kPrimaryColor,
                value: task[widget.index]["isCompleted"],
                onChanged: (value) {
                  taskOperation.taskComplete(widget.index);
                }),
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.6,
              child: task[widget.index]["isCompleted"] == false
                  ? Text(
                      task[widget.index]["task"],
                      style: const TextStyle(overflow: TextOverflow.ellipsis),
                    )
                  : Text(
                      task[widget.index]["task"],
                      style: const TextStyle(
                          overflow: TextOverflow.ellipsis,
                          decoration: TextDecoration.lineThrough),
                    ),
            ),
          ],
        ),
        GestureDetector(
          onTap: () {
            taskOperation.deleteTask(widget.index, () => widget.saveData);
          },
          child: Container(
            height: 35,
            width: 35,
            margin: const EdgeInsets.only(right: 5),
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
