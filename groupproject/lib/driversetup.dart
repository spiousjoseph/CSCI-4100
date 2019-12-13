import 'package:flutter/material.dart';
import 'package:flutter_i18n/flutter_i18n.dart';
import 'package:flutter_i18n/flutter_i18n_delegate.dart';
import 'package:groupproject/shared/constants.dart';
import 'package:groupproject/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:groupproject/models/user.dart';


class DriverSetupPage extends StatefulWidget {
  DriverSetupPage({Key key, this.title}) : super(key: key);
  final String title;
  @override
  DriverSetup createState() => DriverSetup();
}

class DriverSetup extends State<DriverSetupPage>{

  final _formKey = GlobalKey<FormState>();
  final AuthService _auth = AuthService();
  

  String _name = "";
  String _originDestination = "";
  String _cost = "";
  String _numOfSeats = "";
  String _error;
  bool _tripCreated = false;
  // String _NumberOfSeats;
  // String _DriversLicense;
  

  @override
  Widget build(BuildContext context){
    final user = Provider.of<User>(context);
    String userUID = user.uid;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange[400],
        title: Text('Driver Setup'),
      actions: <Widget>[
        FlatButton(
          child: Text('EN', style: TextStyle(color: Colors.white)),
          onPressed: (){
            Locale newLocale = Locale('en');
            setState((){
              FlutterI18n.refresh(context,newLocale);
            });
          },
        ),
        FlatButton(
            child: Text('FR', style: TextStyle(color: Colors.white)),
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/home.jpg'),
            fit: BoxFit.cover,
          ),
        ),
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
                decoration: textInputDecoration.copyWith(hintText: 'Origin / Destination'),
                validator: (val) => val.isEmpty ? 'Please enter the origin and destination of trip' : null,
                onChanged: (val) {
                  setState(() => _originDestination = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Cost per Passenger'),
                validator: (val) => val.isEmpty ? 'Please enter a price' : null,
                onChanged: (val) {
                  setState(() => _cost = val);
                },
              ),
              SizedBox(height: 30.0),
              TextFormField(
                decoration: textInputDecoration.copyWith(hintText: 'Number of Seats'),
                validator: (val) => val.isEmpty ? 'Please a number of availible seats' : null,
                onChanged: (val) {
                  setState(() => _numOfSeats = val);
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
                     _auth.createDriverTrip(_name, _originDestination, _cost, _numOfSeats);
                     _tripCreated = true; // Add a check later
                  }
                }
              ), 
              
              // SizedBox(height: 50.0),
              // Text(
              //   "TRIP CREATED",
              //   style: TextStyle(color: Colors.white, fontSize: 15.0),
              // ),

              // Comment out after check is implemented
              SizedBox(height: 50.0),
              Text(
                "CAUTION: Only one trip is allowed at a time. Updating values with an exist trip up will replace those values",
                style: TextStyle(color: Colors.white, fontSize: 15.0),
              ),
            ],
          ),
        ),
      ),
      
      // floatingActionButton: FloatingActionButton(
      //   onPressed: () {
      //     // 
      //   },
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
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