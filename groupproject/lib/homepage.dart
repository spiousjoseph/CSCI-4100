import 'package:flutter/material.dart';
import 'package:groupproject/driversetup.dart';

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(

        title: Text(widget.title),
      ),
      body: Center(

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            RaisedButton(
              onPressed: () {
                Navigator.push(context,
                  MaterialPageRoute(builder: (context) => DriverSetup()),
                );

              },
              textColor: Colors.white,
              color: Color(0xFFFF9900),
              child: Text('Driver', style: TextStyle(fontSize: 20),),
            ),
            RaisedButton(
              onPressed: () {},
              textColor: Colors.white,
              color: Color(0xFFFF9900),
              child: Text('Passenger', style: TextStyle(fontSize: 20),),
            ),
          ],
        ),
      ),

    );
  }
}