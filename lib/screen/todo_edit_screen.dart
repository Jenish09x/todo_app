import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';
import 'package:todo_app/utils/color.dart';

import '../utils/global.dart';

class TodoEditScreen extends StatefulWidget {
  const TodoEditScreen({super.key});

  @override
  State<TodoEditScreen> createState() => _TodoEditScreenState();
}

class _TodoEditScreenState extends State<TodoEditScreen> {
  @override
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtdes = TextEditingController();
  int colorIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To-Do"),
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: const Icon(
              CupertinoIcons.back,
            ),
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Add To-Do",
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20,
              ),
              TextField(
                controller: txtTitle,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Title"),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              TextField(
                controller: txtdes,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  label: Text("Description"),
                ),
              ),
              const SizedBox(height: 20),
              Container(
                height: MediaQuery.of(context).size.height * 0.10,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    color: colors[colorIndex]),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    TextButton(
                        onPressed: () {
                          setState(() {
                            colorIndex=0;
                          });
                        },
                        child: const Text(
                          "Low",
                          style: TextStyle(fontSize: 15),
                        )),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            colorIndex=1;
                          });
                        },
                        child: const Text("Medium",
                            style: TextStyle(fontSize: 15))),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            colorIndex=2;
                          });
                        },
                        child:
                            const Text("High", style: TextStyle(fontSize: 15))),
                    TextButton(
                        onPressed: () {
                          setState(() {
                            colorIndex=3;
                          });
                        },
                        child: const Text("Urgent",
                            style: TextStyle(fontSize: 15))),
                  ],
                ),
              )
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            ToDoModel data = ToDoModel(
              Title: txtTitle.text,
              Des: txtdes.text,
            );
            Global.g1.dataList.add(data);
            Navigator.pop(context);
          },
          child: const Icon(Icons.save_alt),
        ),
      ),
    );
  }
}
