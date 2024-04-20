import 'package:api_calling_using_http/models/task.model.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Task? myTask;
  List<Task>? myTaskList;
  String? currentJson;
  @override
  Widget build(BuildContext context) {
    Map<String, dynamic> data = {
      "Title": "My TAks",
      "description": "Here is my task",
      "isCoplted": false,
      "date": "20-03-2024"
    };

    List<Map<String, dynamic>> data2 = [
      {
        "Title": "My Tak-1",
        "description": "description-1",
        "isCoplted": false,
        "date": "20-03-2024"
      },
      {
        "Title": "My Task-2",
        "description": "description-2",
        "isCoplted": false,
        "date": "23-03-2024"
      },
      {
        "Title": "My Task-3",
        "description": "description-3",
        "isCoplted": false,
        "date": "24-03-2024"
      }
    ];

    getTaskObject() {
      setState(() {
        myTask = Task.fromjson(data);
        myTaskList = Task.fromlistJson(data2);
      });
    }

    return Scaffold(
      appBar: AppBar(
        title: Text("JSON to Model / Class"),
      ),
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          myTaskList != null
              ? Column(
                  children: [
                    ListView.builder(
                        itemCount: myTaskList!.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          return Card(
                            child: InkWell(
                              onTap: () {
                                currentJson =
                                    myTaskList![index].toJson().toString();
                                setState(() {});
                              },
                              child: ListTile(
                                title: Text(myTaskList![index].task),
                                subtitle: Text(myTaskList![index].date),
                              ),
                            ),
                          );
                        }),
                    currentJson != null ? Text(currentJson!) : Container()
                  ],
                )
              : ElevatedButton(
                  onPressed: () {
                    getTaskObject();
                    setState(() {});
                  },
                  child: Text("Get object"))
        ],
      ),
    );
  }
}
