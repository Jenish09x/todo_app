import 'package:flutter/material.dart';

class ToDoModel {
  String? Des, Title;
  Colors? colors;

  ToDoModel({this.colors,this.Title, this.Des});

  factory ToDoModel.fromMap(Map m1) {
    ToDoModel f1 = ToDoModel(
      colors: m1["color"],
      Des: m1['Des'],
      Title: m1['Title'],
    );
    return f1;
  }
}
