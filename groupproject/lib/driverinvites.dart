import 'package:flutter/material.dart';
import 'package:groupproject/passengersetup.dart';
import 'package:groupproject/driverprofile.dart';


class DriverInvites extends StatelessWidget{

  @override
  Widget build(BuildContext context) {
    int selectedIndex = 0;
    return Scaffold(
      appBar: AppBar(

        title: Text('Invites'),

      ),
      body: Center(
        child: GestureDetector(
          child: ListView( //change this to add the invites dynamically, just for view representation for now
            children: <Widget>[
              Card(
                child: ListTile(
                  leading: Icon(Icons.person_pin),
                  title: Text('John Snow'),
                  trailing: Row( mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      RaisedButton(
                        onPressed: () {

                        },
                        color: Colors.green,
                        child: Icon(Icons.check_circle),
                      ),
                      RaisedButton(
                        onPressed: () {

                        },
                        textColor: Colors.white,
                        color: Colors.red,
                        child: Icon(Icons.cancel),

                      ),
                    ],
                  ),
                ),
              ),

            ],

          ),

        ),

      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () => {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => DriverProfile()),
          ),
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );



  }

}