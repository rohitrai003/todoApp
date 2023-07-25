import 'package:flutter/material.dart';
import 'package:todo_list_app/Constant/Color.dart';
import '../Constant/value.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});
  @override
  _HomePage createState() => _HomePage();
}

class _HomePage extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController _controller = TextEditingController();

//Mood change emoji on the top left app bar
    emoji() {
      return showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            insetPadding:
                const EdgeInsets.symmetric(vertical: 10, horizontal: 10),
            backgroundColor: Colors.white.withOpacity(0.7),
            content: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mood[5] = mood[0];
                          Navigator.pop(context);
                        });
                      },
                      icon: Text(
                        mood[0],
                        style: const TextStyle(fontSize: 20),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mood[5] = mood[1];
                          Navigator.pop(context);
                        });
                      },
                      icon: Text(
                        mood[1],
                        style: const TextStyle(fontSize: 20),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mood[5] = mood[2];
                          Navigator.pop(context);
                        });
                      },
                      icon: Text(
                        mood[2],
                        style: const TextStyle(fontSize: 20),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mood[5] = mood[3];
                          Navigator.pop(context);
                        });
                      },
                      icon: Text(
                        mood[3],
                        style: const TextStyle(fontSize: 20),
                      )),
                  IconButton(
                      onPressed: () {
                        setState(() {
                          mood[5] = mood[4];
                          Navigator.pop(context);
                        });
                      },
                      icon: Text(
                        mood[4],
                        style: const TextStyle(fontSize: 20),
                      )),
                ]),
          );
        },
      );
    }

// This is the appbar for the app.
    appBar() => AppBar(
          backgroundColor: kPrimaryColor,
          title: Text(
            'T O D O  A P P',
            style: TextStyle(color: kSecondaryColor),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Text(
              mood[5],
              style: const TextStyle(fontSize: 30),
            ),
            onPressed: () {
              emoji();
            },
          ),
        );

//When the task is not empty, This screen will run
    withTask() {
      return Expanded(
          child: ListView.builder(
              itemCount: task.length,
              itemBuilder: (context, index) {
                return Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  height: 50,
                  margin:
                      const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  decoration: BoxDecoration(
                    color: kSecondaryColor,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: const [
                      BoxShadow(
                          offset: Offset(2, 4),
                          color: Colors.grey,
                          blurRadius: 5),
                    ],
                  ),
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Row(
                          children: [
                            Checkbox(
                                value: taskCompleted[index],
                                onChanged: (value) {
                                  setState(() {
                                    taskCompleted[index] =
                                        !taskCompleted[index];
                                  });
                                }),
                            SizedBox(
                              width: MediaQuery.of(context).size.width * 0.6,
                              child: taskCompleted[index] == false
                                  ? Text(task[index])
                                  : Text(
                                      task[index],
                                      style: const TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough),
                                    ),
                            ),
                          ],
                        ),
                        GestureDetector(
                          onTap: () {
                            setState(() {
                              task.removeAt(index);
                            });
                          },
                          child: Container(
                            height: 35,
                            width: 35,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(5),
                                color: kPrimaryColor),
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
              }));
    }

//When the task is empty, This will be the screen
    withoutTask() {
      return const Expanded(
        child: Center(
          child: Text(
            'There is no task to show',
            style: TextStyle(fontSize: 30),
          ),
        ),
      );
    }

// Button for adding task in the list
    addButton() => showDialog(
          context: context,
          builder: (context) {
            return AlertDialog(
              backgroundColor: kSecondaryColor,
              title: const Text('ADD TASK'),
              content: TextField(
                controller: _controller,
                decoration: InputDecoration(
                    hintText: 'Add your task',
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: const BorderSide(
                            color: Colors.black,
                            width: 5,
                            style: BorderStyle.solid))),
              ),
              actions: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    onPressed: () {
                      setState(() {
                        task.add(_controller.text);
                        _controller.clear();
                        Navigator.pop(context);
                      });
                    },
                    child: const Text('Add')),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kPrimaryColor),
                    onPressed: () {
                      Navigator.pop(context);
                      _controller.clear();
                    },
                    child: const Text('Cancel'))
              ],
            );
          },
        );

    //Main code starts here

    return Scaffold(
      appBar: appBar(),
      backgroundColor: kSecondaryColor,
      body: Container(
        padding: const EdgeInsets.all(10),
        child: Column(children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                '${date.day}/${date.month}/${date.year}',
                style: const TextStyle(fontSize: 15),
              ),
              Text(
                week[date.weekday].toString().toUpperCase(),
                style: const TextStyle(fontSize: 15),
              ),
            ],
          ),
          const SizedBox(
            height: 30,
          ),
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'All Todo Tasks 👇',
              style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
            ),
          ),
          const SizedBox(
            height: 20,
          ),

          //Main body
          task.isEmpty ? withoutTask() : withTask(),
          //the main body ends here
        ]),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        onPressed: () {
          addButton();
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
