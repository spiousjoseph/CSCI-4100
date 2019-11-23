import 'package:flutter/material.dart';

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

              ],
            ),





          ],
        ),
      ),
    );

  }

}