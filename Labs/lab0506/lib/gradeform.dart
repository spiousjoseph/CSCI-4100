import 'package:flutter/material.dart';

class GradeForm extends StatelessWidget {
  static String id = '';
  static String gr = '';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Grade"),
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
                    onSubmitted: (text){
                      id = text;
                    },
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
                    onSubmitted: (text){
                      gr = text;
                    },
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
          Navigator.pop(context,true);

        },

        child: Icon(Icons.save),
      ),

    );
  }
}
