//When the task is not empty, This screen will run
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:todo_list_app/src/components/itemsBox.dart';
import 'package:todo_list_app/src/data/taskList.dart';

withTask(context, Future<dynamic> save) {
  return Expanded(
    child: ListView.builder(
        itemCount: task.length,
        itemBuilder: (context, index) {
          return ItemBox(
            index: index,
            saveData: save,
            length: task.length,
          );
        }),
  );
}

//When the task is empty, This will be the screen
withoutTask() {
  return Expanded(
    // child: SingleChildScrollView(
    //   scrollDirection: Axis.vertical,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Lottie.asset('assets/animation/emptyListLottie.json',
            fit: BoxFit.fitWidth, frameRate: FrameRate(60), height: 250),
        const Text(
          'There is no task to show',
          style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
        ),
      ],
    ),
  );
}
