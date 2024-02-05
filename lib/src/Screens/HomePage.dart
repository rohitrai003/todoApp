import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';
import 'package:todo_list_app/src/Constant/Color.dart';
import 'package:todo_list_app/src/components/dateAndDay.dart';
import 'package:todo_list_app/src/components/items.dart';
import 'package:todo_list_app/src/data/saveAndLoadData.dart';
import 'package:todo_list_app/src/provider/taskOperation.dart';

import '../components/appBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    loadList();
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();
    var taskOperation = Provider.of<TaskOperation>(context);

//When the task is not empty, This screen will run
    withTask() {
      return Expanded(
        child: ListView.builder(
            itemCount: taskOperation.task.length,
            itemBuilder: (context, index) {
              return ItemBox(index: index);
            }),
      );
    }

//When the task is empty, This will be the screen
    withoutTask() {
      return Expanded(
        child: Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Lottie.asset('assets/emptyListLottie.json',
                  fit: BoxFit.fitWidth, frameRate: FrameRate(60), height: 250),
              const Text(
                'There is no task to show',
                style: TextStyle(fontSize: 25, fontStyle: FontStyle.italic),
              ),
            ],
          ),
        ),
      );
    }
    //Main code starts here

    return Scaffold(
      appBar: customAppBar('My ToDo App'),
      backgroundColor: kSecondaryColor,
      // drawer: Drawer(),
      body: Container(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
        child: Column(children: [
          dateAndDay(),
          const SizedBox(
            height: 30,
          ),
          const Padding(
            padding: EdgeInsets.only(left: 10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'All Todo Tasks 👇',
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //Main body
          taskOperation.task.isEmpty ? withoutTask() : withTask(),
          //the main body ends here
          SizedBox(
              height: 60,
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
                      padding: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                          color: thirdColor,
                          borderRadius: BorderRadius.circular(5),
                          border: Border.all(width: 1)),
                      width: MediaQuery.of(context).size.width * 0.7,
                      child: Center(
                        child: TextFormField(
                          controller: _controller,
                          cursorColor: kPrimaryColor,
                          decoration: const InputDecoration(
                              hintText: 'Add your next target here...',
                              border: OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      )),
                  ElevatedButton(
                      onPressed: () {
                        taskOperation.addTask(_controller.text, context);
                        saveList(taskOperation.task);
                      },
                      style: ElevatedButton.styleFrom(
                          minimumSize: const Size(60, 60),
                          elevation: 0,
                          backgroundColor: kPrimaryColor),
                      child: const Center(child: Text('Add'))),
                ],
              )),
          const SizedBox(
            height: 15.0,
          )
        ]),
      ),
    );
  }
}
