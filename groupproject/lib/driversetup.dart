import 'package:flutter/material.dart';
import 'package:groupproject/passengersetup.dart';
import 'package:groupproject/driverinvites.dart';

class DriverSetup extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Setup Your Carpool'),
      ),
      body: Center(
        child: ListView(
          children: <Widget>[
            //Name row
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                TextField(
                    decoration: InputDecoration(
                      labelText: 'Name: ',
                      hintText: 'Enter your Name',
                    ),
                  ),
                TextField(
                    decoration: InputDecoration(
                      labelText: 'Car: ',
                      hintText: 'Enter your Car',
                    ),
                  ),
                TextFormField(
                  initialValue: '0',
                  decoration: InputDecoration(
                    labelText: 'Number of Seats: ',
                    hintText: 'Enter your number of Seats',
                  ),
                ),
                TextField(
                  decoration: InputDecoration(
                    labelText: 'Driver License: ',
                    hintText: 'Enter your Driver License Information',
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context,
            MaterialPageRoute(builder: (context) => DriverInvites()),
          );
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

}