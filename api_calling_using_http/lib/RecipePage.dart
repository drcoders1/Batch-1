import 'dart:convert';

import 'package:api_calling_using_http/models/recipe.model.dart';
import 'package:api_calling_using_http/models/todo.model.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class RecipePage extends StatefulWidget {
  RecipePage({super.key});

  @override
  State<RecipePage> createState() => _RecipePageState();
}

class _RecipePageState extends State<RecipePage> {
  List<Recipe> recipeList = [];
  bool isLoading = false;
  getTodos() async {
    setState(() {
      isLoading = true;
    });
    var data = await http.get(Uri.parse("https://dummyjson.com/recipes"));
    setState(() {
      recipeList = RecipeData.fromJson(jsonDecode(data.body)).recipes;
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
                  recipeList.isNotEmpty
                      ? ListView.builder(
                          itemCount: recipeList.length,
                          shrinkWrap: true,
                          itemBuilder: (context, index) {
                            return Card(
                              child: ListTile(
                                  title: Text(recipeList[index].name),
                                  trailing: Text(
                                    recipeList[index].userId.toString(),
                                  ),
                                  leading:
                                      Text(recipeList[index].id.toString())),
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
