import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class MyObject {
  final String name;
  final int age;
  final List<AnotherObject> anotherObjectList;

  MyObject(
      {required this.name, required this.age, required this.anotherObjectList});

  factory MyObject.fromJson(Map<String, dynamic> json) {
    List<dynamic> nestedListJson = json['anotherObjectList'];
    List<AnotherObject> nestedList =
        nestedListJson.map((item) => AnotherObject.fromJson(item)).toList();
    return MyObject(
      name: json['name'],
      age: json['age'],
      anotherObjectList: nestedList,
    );
  }

  Map<String, dynamic> toJson() {
    List<Map<String, dynamic>> nestedListJson =
        anotherObjectList.map((item) => item.toJson()).toList();
    return {
      'name': name,
      'age': age,
      'anotherObjectList': nestedListJson,
    };
  }
}

class AnotherObject {
  final String title;

  AnotherObject({required this.title});

  factory AnotherObject.fromJson(Map<String, dynamic> json) {
    return AnotherObject(
      title: json['title'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
    };
  }
}

void saveListToSharedPreferences(List<MyObject> list) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String> encodedList =
      list.map((item) => jsonEncode(item.toJson())).toList();
  prefs.setStringList('myObjectList', encodedList);
}

Future<List<MyObject>> getListFromSharedPreferences() async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  List<String>? encodedList = prefs.getStringList('myObjectList');
  if (encodedList == null) {
    return [];
  }
  List<MyObject> list =
      encodedList.map((item) => MyObject.fromJson(jsonDecode(item))).toList();
  return list;
}
