import 'package:flutter/material.dart';
import 'package:todo_app/model/todo_model.dart';

import '../utils/global.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  TextEditingController txtTitle = TextEditingController();
  TextEditingController txtdes = TextEditingController();
  bool isGrid = true;

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text("To-Do"),
          centerTitle: true,
          actions: [
            IconButton(
                onPressed: () {
                  setState(() {
                    isGrid = !isGrid;
                  });
                },
                icon: Icon(isGrid ? Icons.grid_view_outlined : Icons.list)),
          ],
        ),
        body: isGrid
            ? ListView.builder(
                itemCount: Global.g1.dataList.length,
                itemBuilder: (context, index) {
                  ToDoModel data = Global.g1.dataList[index];
                  return InkWell(
                    onDoubleTap: () {
                      setState(() {
                        Global.g1.dataList.removeAt(index);
                      });
                    },
                    onLongPress: () {
                      ToDoModel t1 = Global.g1.dataList[index];
                      txtTitle.text = t1.Title!;
                      txtdes.text = t1.Des!;
                      editDialog(context, index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.15,
                      width: MediaQuery.of(context).size.height,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data.Title}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${data.Des}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              )
            : GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2),
                itemCount: Global.g1.dataList.length,
                itemBuilder: (context, index) {
                  ToDoModel data = Global.g1.dataList[index];
                  return InkWell(
                    onDoubleTap: () {
                      setState(() {
                        Global.g1.dataList.removeAt(index);
                      });
                    },
                    onLongPress: () {
                      ToDoModel t1 = Global.g1.dataList[index];
                      txtTitle.text = t1.Title!;
                      txtdes.text = t1.Des!;
                      editDialog(context, index);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      height: MediaQuery.of(context).size.height * 0.20,
                      width: MediaQuery.of(context).size.width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.amber,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "${data.Title}",
                              style: const TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.bold),
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Text(
                              "${data.Des}",
                              style: const TextStyle(fontSize: 15),
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                },
              ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.pushNamed(context, "edit").then(
              (value) {
                setState(() {});
              },
            );
          },
          child: const Icon(Icons.add),
        ),
      ),
    );
  }

  Future<dynamic> editDialog(BuildContext context, int index) {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          actions: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtTitle,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Title"),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(10),
              child: TextField(
                controller: txtdes,
                decoration: const InputDecoration(
                    border: OutlineInputBorder(), hintText: "Description"),
              ),
            ),
            ElevatedButton(
              onPressed: () {
                setState(
                  () {
                    Global.g1.dataList[index] = ToDoModel(
                      Title: txtTitle.text,
                      Des: txtdes.text,
                    );
                  },
                );
                Navigator.pop(context);
              },
              child: const Text("OK"),
            ),
          ],
        );
      },
    );
  }
}
