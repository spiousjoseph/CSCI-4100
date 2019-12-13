import 'package:flutter/material.dart';
import 'package:groupproject/pages/homeBranches/driversetup.dart';
import 'package:groupproject/pages/homeBranches/drivingtrip.dart';
import 'package:groupproject/pages/homeBranches/localNotes.dart';
import 'package:groupproject/pages/homeBranches/passengersetup.dart';
import 'package:groupproject/pages/homeBranches/seealldrivers.dart';
import 'package:groupproject/services/auth.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {

    return Container(
      child: Scaffold(
        appBar: AppBar(
            title: Text('OnTech Carpool'),
            backgroundColor: Colors.orange[400],
            elevation: 0.0,
            actions: <Widget>[
              FlatButton.icon(
                icon: Icon(Icons.person),
                label: Text('logout'),
                onPressed: () async {
                  await _auth.signOut();
                },
              ),
            ],
          ),
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/home.jpg'),
              fit: BoxFit.cover,
            ),
          ),
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DriverSetupPage()),
                      );
                    },
                    textColor: Colors.white,
                    color: Color(0xFFFF9900),
                    child: Text('Driver', style: TextStyle(fontSize: 30),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PassengerSetup()),
                      );
                    },
                    textColor: Colors.white,
                    color: Color(0xFFFF9900),
                    child: Text('Passenger', style: TextStyle(fontSize: 30),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => DrivingTrip()),
                      );
                    },
                    textColor: Colors.white,
                    color: Color(0xFFFF9900),
                    child: Text('My Driving Trip', style: TextStyle(fontSize: 30),),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 40.0),
                  child: RaisedButton(
                    onPressed: () {
                      Navigator.push(context,
                        MaterialPageRoute(builder: (context) => ShowAllDrivers()),
                      );
                    },
                    textColor: Colors.white,
                    color: Color(0xFFFF9900),
                    child: Text('See All Drivers', style: TextStyle(fontSize: 30),),
                  ),
                ),
              ],
            ),
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => LocalNotesPage()),
            );
          },
        tooltip: 'Add personal notes',
        child: Icon(Icons.add),
      ),
      ),
    );
  }
}
