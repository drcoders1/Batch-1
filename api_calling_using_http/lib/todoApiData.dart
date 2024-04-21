import 'dart:convert';

import 'package:api_calling_using_http/models/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class TaskPage extends StatefulWidget {
  TaskPage({super.key});

  @override
  State<TaskPage> createState() => _TaskPageState();
}

class _TaskPageState extends State<TaskPage> {
  List<Todo> myTodoList = [];
  bool isLoading = false;
  getTodos() async {
    setState(() {
      isLoading = true;
    });
    var data = await http.get(Uri.parse("https://dummyjson.com/todos"));
    List response = jsonDecode(data.body)["todos"];
    setState(() {
      myTodoList = Todo.fromlistJson(response);
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: isLoading
            ? Center(child: CircularProgressIndicator())
            : Column(
                children: [
                  myTodoList.isNotEmpty
                      ? ListView.builder(
                          itemCount: myTodoList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                title: Text(myTodoList[index].todo),
                                trailing: Text(
                                  myTodoList[index].userId.toString(),
                                ),
                                leading: Icon(myTodoList[index].completed
                                    ? Icons.check_box
                                    : Icons.check_box_outline_blank),
                              ),
                            );
                          })
                      : ElevatedButton(
                          onPressed: () async {
                            await getTodos();
                          },
                          child: Text("Get todos"))
                ],
              ),
      ),
    );
  }
}
