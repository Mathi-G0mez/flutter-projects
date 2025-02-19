import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: todoapp(),
    );
  }
}

class todoapp extends StatefulWidget {
  const todoapp({super.key});

  @override
  State<todoapp> createState() => _todoappState();
}

class _todoappState extends State<todoapp> {
  TextEditingController textController = TextEditingController();
  String displaytxt = "No tasks yet!";
  List<String> tasks = [];

  // void _removeTask(int index) {
  //
  // }

  // void editTask(int index, String newTask) {
  //   setState(() {
  //     tasks[index] = newTask; // Edit the task at the given index
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: Text("ToDo List",
              style: TextStyle(
                fontStyle: FontStyle.italic,
              )),
          centerTitle: true,
          backgroundColor: Colors.grey.shade300,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Expanded(
                  child: Container(
                    padding: EdgeInsets.all(10.0),
                    child: TextFormField(
                        controller: textController,
                        decoration: InputDecoration(
                            label: Text("Enter a task"),
                            border: OutlineInputBorder())),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: ElevatedButton(
                    onPressed: () {
                      setState(() {
                        tasks.add(textController.text);
                        textController.clear();
                      });
                    },
                    child: Text("Add"),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey.shade300,
                        foregroundColor: Colors.black),
                  ),
                )
              ],
            ),
            Flexible(
              child: ListView.builder(
                  itemCount: tasks.length,
                  itemBuilder: (context, index) {
                    return Container(
                      // padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(50),
                        color: Colors.grey.shade200,
                      ),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                                padding: EdgeInsets.all(10.0),
                                child: Text(
                                  tasks[index],
                                  style: TextStyle(fontSize: 15),
                                )),
                          ),
                          IconButton(
                              onPressed: () {
                                setState(() {
                                  tasks.removeAt(
                                      index); // Remove task at the given index
                                });
                              },
                              icon: Icon(
                                Icons.delete,
                                color: Colors.red,
                              )),
                        ],
                      ),
                    );
                  }),
            ),
          ],
        ),
        bottomNavigationBar: BottomNavigationBar(items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.search), label: "Search"),
          BottomNavigationBarItem(icon: Icon(Icons.person_2), label: "bb")
        ]));
  }
}
