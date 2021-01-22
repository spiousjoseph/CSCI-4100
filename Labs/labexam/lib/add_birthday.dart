import 'package:flutter/material.dart';
import 'package:labexam/birthday_list.dart';

class addBirthday extends StatelessWidget{
  TextEditingController nameController = new TextEditingController();
  String type;
  TextEditingController dateController = new TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Grade"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
                  TextField(
              controller: nameController,
              decoration: InputDecoration(
                hintText: 'Name ',
              ),
            ),
            SimpleDialog(
              title: Text('Friend'),
              children: <Widget>[
                SimpleDialogOption(
                  child: const Text('Self'),
                  onPressed: () {type = 'Self'; },
                ),
                SimpleDialogOption(
                  child: const Text('Friend'),
                  onPressed: () { type = 'Friend'; },
                ),
                SimpleDialogOption(
                  child: const Text('Family'),
                  onPressed: () {type = 'Family';  },
                ),
                SimpleDialogOption(
                  child: const Text('Co-Worker'),
                  onPressed: () {type = 'Co-Worker';  },
                ),
              ],
            ),
            //was going to implent datepicker, but ran out of time
            TextField(
              controller: dateController,
              decoration: InputDecoration(
                hintText: 'Date ',
              ),
            ),






    ],
        ),
      ),

      floatingActionButton: FloatingActionButton(
        // Navigate to Add Grade Screen
        onPressed: () {
          Navigator.pop(context,new myList(nameController.text, type, dateController.text));

        },

        child: Icon(Icons.save),
      ),

    );
  }


  String toOrdinal(number) {
    if ((number >= 10) && (number <= 19)) {
      return number.toString() + 'th';
    } else if ((number % 10) == 1) {
      return number.toString() + 'st';
    } else if ((number % 10) == 2) {
      return number.toString() + 'nd';
    } else if ((number % 10) == 3) {
      return number.toString() + 'rd';
    } else {
      return number.toString() + 'th';
    }
  }
  String toMonthName(monthNum) {
    switch (monthNum) {
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return 'Error';
    }
  }
  String toDateString(DateTime date) {
    return '${toMonthName(date.month)} ${toOrdinal(date.day)}';
  }

}