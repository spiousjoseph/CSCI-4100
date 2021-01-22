import 'package:flutter/material.dart';
import 'package:labexam/add_birthday.dart';
import 'birthday_list.dart';

void main() => runApp(MyApp());


class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Birthday Reminder',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
      ),
      home: BirthdayList(title: 'Birthday Reminder'),
      debugShowCheckedModeBanner: false,
    );
  }
}



