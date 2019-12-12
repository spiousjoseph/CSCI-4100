import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:groupproject/shared/constants.dart';


class DriverSetupPage extends StatefulWidget {
  DriverSetupPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  DriverSetup createState() => DriverSetup();
}

class DriverSetup extends State<DriverSetupPage>{

  final _formKey = GlobalKey<FormState>();

  String _name = "";
  String _origin = "";
  String _dest = "";
  String _cost = "";
  int _numOfSeats = 0;
  String _error;
  // String _NumberOfSeats;
  // String _DriversLicense;
  

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver Setup'),
      actions: <Widget>[
        FlatButton(
          child: Text('EN'),
          onPressed: (){
            Locale newLocale = Locale('en');
            setState((){
              FlutterI18n.refresh(context,newLocale);
            });
          },
        ),
        FlatButton(
            child: Text('FR'),
            onPressed: () {
              Locale newLocale = Locale('fr');
              setState(() {
                FlutterI18n.refresh(context, newLocale);
              });
            }
          )
    ]
      ),
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 20.0, horizontal: 50.0),
        child: Form(
          key: _formKey,
          child: Column(
            children: <Widget>[
              SizedBox(height: 30.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Name'),
                validator: (val) => val.isEmpty ? 'Enter your name' : null,
                onChanged: (val) {
                  setState(() => _name = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Origin'),
                validator: (val) => val.isEmpty ? 'Please enter the starting location' : null,
                onChanged: (val) {
                  setState(() => _origin = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Destination'),
                validator: (val) => val.isEmpty ? 'Please enter the destination' : null,
                onChanged: (val) {
                  setState(() => _dest = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                obscureText: true,
                decoration: textInputDecoration.copyWith(hintText: 'Cost per Passenger'),
                validator: (val) => val.isEmpty ? 'Please enter a price' : null,
                onChanged: (val) {
                  setState(() => _cost = val);
                },
              ),
              SizedBox(height: 20.0),
              RaisedButton(
                color: Colors.pink[400],
                child: Text(
                  'Create Trip',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () async {
                  if(_formKey.currentState.validate()){
                    // await DatabaseService(uid: user.uid).updateUserData(
                    //   _currentSugars ?? snapshot.data.sugars, 
                    //   _currentName ?? snapshot.data.name, 
                    //   _currentStrength ?? snapshot.data.strength
                    // );
                  }
                }
              ),
            ],
          ),
        ),
      ),
      
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // 
        },
        child: Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );

  }

  

}


// Center(
//         child: ListView(
//           children: <Widget>[
//             //Name row
//             Column(
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: <Widget>[
//                 TextField(
//                     decoration: InputDecoration(
//                       labelText: (FlutterI18n.translate(context, 'register.Name')),
//                       hintText: (FlutterI18n.translate(context, 'register.NameHint')),
//                     ),
//                   ),
//                 TextField(
//                     decoration: InputDecoration(
//                       labelText: (FlutterI18n.translate(context, 'register.Car')),
//                       hintText: (FlutterI18n.translate(context, 'register.CarHint')),
//                     ),
//                   ),
//                 TextFormField(
//                   initialValue: '0',
//                   decoration: InputDecoration(
//                     labelText: (FlutterI18n.translate(context, 'register.NumberofSeats')),
//                     hintText: (FlutterI18n.translate(context, 'register.SeatHint')),
//                   ),
//                 ),
//                 TextField(
//                   decoration: InputDecoration(
//                     labelText: (FlutterI18n.translate(context, 'register.DriversLicense')),
//                     hintText: (FlutterI18n.translate(context, 'register.LicenseHint')),
//                   ),
//                 ),
                
//               ],
//             ),

//           ],
//         ),
//       ),