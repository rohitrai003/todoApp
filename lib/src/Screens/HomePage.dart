import 'dart:convert';
import 'dart:math';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:double_tap_to_exit/double_tap_to_exit.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:todo_list_app/src/Constant/Color.dart';
import 'package:todo_list_app/src/Constant/value.dart';
import 'package:todo_list_app/src/components/dateAndDay.dart';
import 'package:todo_list_app/src/components/taskView.dart';
import 'package:todo_list_app/src/data/taskList.dart';
import 'package:todo_list_app/src/provider/taskOperation.dart';

import '../components/appBar.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    AwesomeNotifications().isNotificationAllowed().then((isAllowed) => {
          if (!isAllowed)
            {AwesomeNotifications().requestPermissionToSendNotifications()}
        });
    loadList();
    print(currentDate);
  }

  saveList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String jsonData = jsonEncode(task);
    prefs.setString('task', jsonData);
  }

  loadList() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    // task = prefs.getStringList('task')!.toList().cast();

    String jsonData = prefs.getString('task') ?? '[]';
    List<dynamic> decoded = jsonDecode(jsonData);
    task = List<Map<String, dynamic>>.from(decoded);
    setState(() {});
  }

  triggerNotification() {
    AwesomeNotifications().createNotification(
      content: NotificationContent(
          id: 10,
          channelKey: "basic_channel",
          title: "Important Notification",
          body: "Tumhari behen ka pakoda"),
    );
  }

  TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    var taskOperation = Provider.of<TaskOperation>(context);

    //Main code starts here

    return DoubleTapToExit(
        snackBar: const SnackBar(
          content: Text("Tag again to exit"),
        ),
        child: Scaffold(
          appBar: customAppBar(context, 'My ToDo App'),
          drawer: Drawer(
            child: Column(children: [
              const DrawerHeader(
                child: Text('Header'),
              ),
              InkWell(
                onTap: () {
                  triggerNotification();
                },
                child: const ListTile(
                  title: Text("Send Notification"),
                ),
              )
            ]),
          ),
          backgroundColor: kSecondaryColor,
          body: Container(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
            child: Column(children: [
              dateAndDay(),
              const SizedBox(
                height: 10,
              ),
              // Container(
              //   decoration: BoxDecoration(
              //       color: kSecondaryColor,
              //       border: Border.all(width: 1),
              //       boxShadow: const [
              //         BoxShadow(
              //             offset: Offset(1, 1),
              //             blurRadius: 5,
              //             spreadRadius: 1,
              //             color: Colors.grey)
              //       ]),
              //   height: 70,
              //   margin:
              //       const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
              //   child: Column(
              //       mainAxisAlignment: MainAxisAlignment.center,
              //       children: [
              //         Center(
              //           child: Text(
              //             " \"${quotes[Random().nextInt(quotes.length)]["quote"]} \"",
              //             style: const TextStyle(),
              //             textAlign: TextAlign.center,
              //           ),
              //         ),
              //         Text(quotes[Random().nextInt(quotes.length)]["author"]),
              //       ]),
              // ),
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
              task.isEmpty ? withoutTask() : withTask(context, saveList()),
              //the main body ends here
              Padding(
                padding: const EdgeInsets.only(top: 15.0),
                child: SizedBox(
                    height: 60,
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 5.0),
                            decoration: BoxDecoration(
                                color: thirdColor,
                                borderRadius: BorderRadius.circular(5),
                                border: Border.all(width: 1)),
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Center(
                              child: SingleChildScrollView(
                                child: TextFormField(
                                  controller: _controller,
                                  cursorColor: kPrimaryColor,
                                  decoration: const InputDecoration(
                                      hintText: 'Add your next target here...',
                                      border: OutlineInputBorder(
                                          borderSide: BorderSide.none)),
                                ),
                              ),
                            )),
                        ElevatedButton(
                            onPressed: () {
                              taskOperation.addTask(
                                  _controller.text, context, saveList());
                              _controller.clear();
                            },
                            style: ElevatedButton.styleFrom(
                                shape: const CircleBorder(
                                    side: BorderSide(
                                  width: 1,
                                )),
                                elevation: 0,
                                backgroundColor: kPrimaryColor),
                            child: const Center(
                                child: Text(
                              'ADD',
                              style:
                                  TextStyle(color: Colors.white, fontSize: 15),
                            ))),
                      ],
                    )),
              ),

              const SizedBox(
                height: 15.0,
              )
            ]),
          ),
        ));
  }
}
