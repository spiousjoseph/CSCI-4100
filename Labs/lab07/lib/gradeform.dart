import 'package:flutter/material.dart';
import 'package:lab07/model/grade.dart';


class GradeForm extends StatelessWidget {
  final TextEditingController idCtrl = new TextEditingController();
  final TextEditingController grCtrl = new TextEditingController();
  String id = '';
  String gr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add/Edit Grade"),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[

            //SID row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('SID: '),

                Flexible(
                  child:TextField(
                    controller: idCtrl,
                    decoration: InputDecoration(
                      hintText: 'Enter your Student ID',
                    ),
                  ),
                ),
              ],
            ),

            //Grade row
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                Text('Grade: '),

                Flexible(
                  child:TextField(
                    controller: grCtrl,
                    decoration: InputDecoration(
                        hintText: 'Enter your Grade'
                    ),
                  ),
                ),

              ],
            ),
          ],
        ),


      ),

      floatingActionButton: FloatingActionButton(
        // Navigate to Add Grade Screen
        onPressed: () {
          //print(idCtrl.text + '  ' + grCtrl.text);
          Grade newgrade = new Grade(sid: idCtrl.text, grade: grCtrl.text);
          Navigator.of(context).pop(newgrade);


        },

        child: Icon(Icons.save),
      ),

    );
  }






}
